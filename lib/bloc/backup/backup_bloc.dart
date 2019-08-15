import 'dart:async';
import 'dart:convert';

import 'package:breez/bloc/backup/backup_model.dart';
import 'package:breez/services/background_task.dart';
import 'package:breez/services/breezlib/breez_bridge.dart';
import 'package:breez/services/breezlib/data/rpc.pb.dart';
import 'package:breez/services/injector.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackupBloc {

  static const String BACKUP_SETTINGS_PREFERENCES_KEY = "backup_settings";
  static const String LAST_BACKUP_TIME_PREFERENCE_KEY = "backup_last_time";

  final BehaviorSubject<BackupState> _backupStateController =
      new BehaviorSubject<BackupState>();
  final StreamController<void> _promptBackupController = new StreamController<void>.broadcast();

  final BehaviorSubject<BackupSettings> _backupSettingsController =
      new BehaviorSubject<BackupSettings>(seedValue: BackupSettings.start());
  final _backupNowController = new StreamController<bool>();
  final _restoreRequestController = new StreamController<RestoreRequest>();

  final _multipleRestoreController =
      new StreamController<List<SnapshotInfo>>.broadcast();
  final _restoreFinishedController = new StreamController<bool>.broadcast();

  BreezBridge _breezLib;
  BackgroundTaskService _tasksService;

  SharedPreferences _sharedPrefrences;
  bool _backupServiceNeedLogin = false;

  bool _enableBackupPrompt = false;
  BackupBloc() {
    ServiceInjector injector = new ServiceInjector();
    _breezLib = injector.breezBridge;
    _tasksService = injector.backgroundTaskService;

    SharedPreferences.getInstance().then((sp) {
      _sharedPrefrences = sp;     
      _initializePersistentData();
      _listenBackupPaths();
      _listenBackupNowRequests();
      _listenRestoreRequests();
      _scheduleBackgroundTasks();
    });
  }

  Sink<bool> get backupNowSink => _backupNowController.sink;  
  Sink<BackupSettings> get backupSettingsSink => _backupSettingsController.sink;
  Stream<BackupSettings> get backupSettingsStream =>
      _backupSettingsController.stream;    
  Stream<BackupState> get backupStateStream => _backupStateController.stream;
  Stream<List<SnapshotInfo>> get multipleRestoreStream =>
      _multipleRestoreController.stream;  

  Stream<void> get promptBackupStream => _promptBackupController.stream;  
  Stream<bool> get restoreFinishedStream => _restoreFinishedController.stream;

  Sink<RestoreRequest> get restoreRequestSink => _restoreRequestController.sink;

  close() {
    _backupNowController.close();
    _restoreRequestController.close();
    _multipleRestoreController.close();
    _restoreFinishedController.close();    
    _backupSettingsController.close();
  }

  void _backupNow() {    
    _breezLib.signIn(_backupServiceNeedLogin)
      .then((_) => _breezLib.requestBackup());      
  }

  void _initializePersistentData() {     

    //last backup time persistency
    int lastTime = _sharedPrefrences.getInt(LAST_BACKUP_TIME_PREFERENCE_KEY);
    _backupStateController
          .add(BackupState(DateTime.fromMillisecondsSinceEpoch(lastTime ?? 0), false)); 
       
    _backupStateController.stream.listen((state) {      
      _sharedPrefrences.setInt(
          LAST_BACKUP_TIME_PREFERENCE_KEY, state.lastBackupTime.millisecondsSinceEpoch);
    }, onError: (e){      
      _pushPromptIfNeeded();
    });

    //settings persistency
    var backupSettings =
        _sharedPrefrences.getString(BACKUP_SETTINGS_PREFERENCES_KEY);
    if (backupSettings != null) {
      Map<String, dynamic> settings = json.decode(backupSettings);
      _backupSettingsController.add(BackupSettings.fromJson(settings));
    }
    _backupSettingsController.stream.listen((settings) {
      _sharedPrefrences.setString(
          BACKUP_SETTINGS_PREFERENCES_KEY, json.encode(settings.toJson()));
    });
  }
  
  void _listenBackupNowRequests() {
    _backupNowController.stream.listen((_) => _backupNow());
  }

  _listenBackupPaths() { 
    var backupOperations = [
      NotificationEvent_NotificationType.PAYMENT_SENT, 
      NotificationEvent_NotificationType.INVOICE_PAID,
      NotificationEvent_NotificationType.FUND_ADDRESS_CREATED
    ];

    Observable(_breezLib.notificationStream)     
    .listen((event) {
      if (event.type == NotificationEvent_NotificationType.BACKUP_REQUEST) {
        _backupServiceNeedLogin = false;
        _backupStateController.add((BackupState(_backupStateController.value.lastBackupTime, true)));
      }      
      if (event.type == NotificationEvent_NotificationType.BACKUP_AUTH_FAILED) {
        _backupServiceNeedLogin = true;
        _backupStateController.addError(null);
      }
      if (event.type == NotificationEvent_NotificationType.BACKUP_FAILED) {        
        _backupStateController.addError(null);
      }
      if (event.type == NotificationEvent_NotificationType.BACKUP_SUCCESS) {
        _backupServiceNeedLogin = false;      
        _backupStateController.add(BackupState(DateTime.now(), false));
      } 
      if (backupOperations.contains(event.type)) {
        _enableBackupPrompt = true;
        _pushPromptIfNeeded();    
      }       
    });
  }

  void _listenRestoreRequests() {
    _restoreRequestController.stream.listen((request) {
      if (request == null) {
        _breezLib.getAvailableBackups()
        .then((backups) {          
          List snapshotsArray = json.decode(backups) as List;
          List<SnapshotInfo> snapshots = List<SnapshotInfo>();
          if (snapshotsArray != null) {            
            snapshots = snapshotsArray.map((s){
              return SnapshotInfo.fromJson(s);
            }).toList();
          }
          _multipleRestoreController.add(snapshots);
        }).catchError((error) {
          _restoreFinishedController.addError(error);
        });

        return;     
      }

      _breezLib.restore(request.snapshot.nodeID, request.pinCode)
        .then((_) => _restoreFinishedController.add(true))
        .catchError(_restoreFinishedController.addError);      
    });  
  }

  _pushPromptIfNeeded(){
    if (_enableBackupPrompt && _backupServiceNeedLogin) {
      _enableBackupPrompt = false;      
      _promptBackupController.add(null);
    }
  }

  _scheduleBackgroundTasks(){
    var backupFinishedEvents = [
      NotificationEvent_NotificationType.BACKUP_SUCCESS,
      NotificationEvent_NotificationType.BACKUP_AUTH_FAILED,
      NotificationEvent_NotificationType.BACKUP_FAILED
    ];
    Completer taskCompleter;

    Observable(_breezLib.notificationStream)     
    .listen((event) {
      if (taskCompleter == null && event.type == NotificationEvent_NotificationType.BACKUP_REQUEST) {
        taskCompleter = new Completer();        
        _tasksService.runAsTask(taskCompleter.future, (){
          taskCompleter?.complete();
          taskCompleter = null;
        });
        return;
      }

      if (taskCompleter != null && backupFinishedEvents.contains(event.type)) {
        taskCompleter?.complete();
        taskCompleter = null;
      }
    });
  }
}

class RestoreRequest {
  final SnapshotInfo snapshot;
  final String pinCode;

  RestoreRequest(this.snapshot, this.pinCode);
}

class SnapshotInfo {
  final String nodeID;	
	final String modifiedTime;
  final bool encrypted;

  SnapshotInfo(this.nodeID, this.modifiedTime, this.encrypted);
  
  SnapshotInfo.fromJson(Map<String, dynamic> json) : 
    this(
      json["NodeID"], 
      json["ModifiedTime"],      
      json["Encrypted"] == true,
    );
}