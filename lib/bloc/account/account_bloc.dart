import 'dart:async';
import 'dart:convert';

import 'package:breez/bloc/account/account_actions.dart';
import 'package:breez/bloc/account/account_permissions_handler.dart';
import 'package:breez/bloc/account/fiat_conversion.dart';
import 'package:breez/bloc/async_action.dart';
import 'package:breez/bloc/user_profile/breez_user_model.dart';
import 'package:breez/logger.dart';
import 'package:breez/services/background_task.dart';
import 'package:breez/services/breezlib/breez_bridge.dart';
import 'package:breez/services/breezlib/data/rpc.pb.dart';
import 'package:breez/services/breezlib/progress_downloader.dart';
import 'package:breez/services/currency_data.dart';
import 'package:breez/services/currency_service.dart';
import 'package:breez/services/device.dart';
import 'package:breez/services/injector.dart';
import 'package:breez/services/notifications.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account_model.dart';
import 'account_synchronizer.dart';

class AccountBloc {
  static const String ACCOUNT_SETTINGS_PREFERENCES_KEY = "account_settings";
  static const String PERSISTENT_NODE_ID_PREFERENCES_KEY = "PERSISTENT_NODE_ID";
  static const String BOOTSTRAPING_PREFERENCES_KEY = "BOOTSTRAPING";

  Timer _exchangeRateTimer;
  Map<String, CurrencyData> _currencyData;

  final _userActionsController = new StreamController<AsyncAction>.broadcast();
  AccountSynchronizer _accountSynchronizer;
  Map<Type, Function> _actionHandlers = Map();
  final _reconnectStreamController = new StreamController<void>.broadcast();

  final _broadcastRefundRequestController =
      new StreamController<BroadcastRefundRequestModel>.broadcast();
  final _broadcastRefundResponseController =
      new StreamController<BroadcastRefundResponseModel>.broadcast();

  final _accountController = new BehaviorSubject<AccountModel>();
  final _accountEnableController = new StreamController<bool>.broadcast();

  final _accountSettingsController = new BehaviorSubject<AccountSettings>();
  final _routingNodeConnectionController = new BehaviorSubject<bool>();

  final _withdrawalController =
      new StreamController<RemoveFundRequestModel>.broadcast();
  final _withdrawalResultController =
      new StreamController<RemoveFundResponseModel>.broadcast();

  final _paymentsController = new BehaviorSubject<PaymentsModel>();
  final _paymentFilterController = new BehaviorSubject<PaymentFilterModel>();

  final _accountNotificationsController =
      new StreamController<String>.broadcast();
  final _completedPaymentsController = new StreamController<CompletedPayment>.broadcast();
  final _lightningDownController = new StreamController<bool>.broadcast();

  final BehaviorSubject<void> _nodeConflictController =
      new BehaviorSubject<void>();
  Stream<Map<String, DownloadFileInfo>> chainBootstrapProgress;

  final AccountPermissionsHandler _permissionsHandler =
      new AccountPermissionsHandler();
  BreezUserModel _currentUser;

  bool _allowReconnect = true;
  bool _startedLightning = false;

  bool _retryingLightningService = false;
  SharedPreferences _sharedPreferences;

  BreezBridge _breezLib;
  Notifications _notificationsService;
  Device _device;

  BackgroundTaskService _backgroundService;
  CurrencyService _currencyService;  

  Completer _onBoardingCompleter = new Completer();
  Stream<BreezUserModel> userProfileStream;

  AccountBloc(this.userProfileStream) {
    ServiceInjector injector = new ServiceInjector();
    _breezLib = injector.breezBridge;
    _notificationsService = injector.notifications;
    _device = injector.device;
    _backgroundService = injector.backgroundTaskService;
    _currencyService = injector.currencyService;
    _actionHandlers = {
      SendPaymentFailureReport: _handleSendQueryRoute,
      ResetNetwork: _handleResetNetwork,
      RestartDaemon: _handleRestartDaemon,
      FetchSwapFundStatus: _fetchFundStatusAction,
      SendPayment: _sendPayment,
      CancelPaymentRequest: _cancelPaymentRequest,
      ChangeSyncUIState: _collapseSyncUI,
      FetchRates: _fetchRates,
    };

    _accountController.add(AccountModel.initial());
    _paymentsController.add(PaymentsModel.initial());
    _paymentFilterController.add(PaymentFilterModel.initial());
    _accountSettingsController.add(AccountSettings.start());

    print("Account bloc started");
    ServiceInjector().sharedPreferences.then((preferences) {
      _sharedPreferences = preferences;
      _refreshAccount();
      //listen streams
      _listenAccountActions();      
      _hanleAccountSettings();
      _listenUserChanges(userProfileStream);
      _listenWithdrawalRequests();      
      _listenFilterChanges();
      _listenAccountChanges();
      _listenEnableAccount();
      _listenMempoolTransactions();
      _listenRoutingNodeConnectionChanges();
      _listenBootstrapStatus();
      _trackOnBoardingStatus();
    });
  }
  Sink<bool> get accountEnableSink => _accountEnableController.sink;  

  Stream<String> get accountNotificationsStream =>
      _accountNotificationsController.stream;
  Sink<AccountSettings> get accountSettingsSink =>
      _accountSettingsController.sink;

  Stream<AccountSettings> get accountSettingsStream =>
      _accountSettingsController.stream;

  Stream<AccountModel> get accountStream => _accountController.stream;
  Sink<BroadcastRefundRequestModel> get broadcastRefundRequestSink =>
      _broadcastRefundRequestController.sink;
  Stream<BroadcastRefundResponseModel> get broadcastRefundResponseStream =>
      _broadcastRefundResponseController.stream;

  Stream<CompletedPayment> get completedPaymentsStream => _completedPaymentsController.stream;
  Stream<bool> get lightningDownStream => _lightningDownController.stream;
  Stream<void> get nodeConflictStream => _nodeConflictController.stream;
  Stream<bool> get optimizationWhitelistExplainStream =>
      _permissionsHandler.optimizationWhitelistExplainStream;
  Sink get optimizationWhitelistRequestSink =>
      _permissionsHandler.optimizationWhitelistRequestSink;
  Sink<PaymentFilterModel> get paymentFilterSink =>
      _paymentFilterController.sink;
  Stream<PaymentFilterModel> get paymentFilterStream =>
      _paymentFilterController.stream;
  Stream<PaymentsModel> get paymentsStream => _paymentsController.stream;
  Stream<bool> get routingNodeConnectionStream =>
      _routingNodeConnectionController.stream;
  Sink<AsyncAction> get userActionsSink => _userActionsController.sink;
  Stream<RemoveFundResponseModel> get withdrawalResultStream =>
      _withdrawalResultController.stream;
  Sink<RemoveFundRequestModel> get withdrawalSink => _withdrawalController.sink;

  Sink<void> get _reconnectSink => _reconnectStreamController.sink;

  //settings persistency
  close() {
    _accountEnableController.close();    
    _paymentsController.close();
    _accountNotificationsController.close();    
    _withdrawalController.close();
    _paymentFilterController.close();
    _lightningDownController.close();
    _reconnectStreamController.close();
    _routingNodeConnectionController.close();
    _broadcastRefundRequestController.close();    
    _userActionsController.close();
    _permissionsHandler.dispose();
  }

  Future<String> getPersistentNodeID() async {
    var preferences = await ServiceInjector().sharedPreferences;
    return preferences.getString(PERSISTENT_NODE_ID_PREFERENCES_KEY);
  }

  Future _bootstrapWitRetry(){    
    return _breezLib.bootstrap().then((downloadNeeded) async {
      print("Account bloc bootstrap has finished");      
    })
    .catchError((err){
      print("bootstrap failed, retrying in 2 seconds...");
      return Future.delayed(Duration(seconds: 2), () => _bootstrapWitRetry());
    });
  }

  Future _cancelPaymentRequest(CancelPaymentRequest cancelRequest){
    _completedPaymentsController.add(CompletedPayment(cancelRequest.paymentRequest, cancelled: true));
    return Future.value(null);
  }

  Future _collapseSyncUI(ChangeSyncUIState stateAction) {
    _accountController.add(_accountController.value.copyWith(syncUIState: stateAction.nextState));
    return Future.value(null);
  }

  Future _fetchFundStatus() {
    if (_currentUser == null) {
      return Future.value(null);
    }

    return _breezLib.getFundStatus(_currentUser.userID).then((status) {      
      _accountController
            .add(_accountController.value.copyWith(addedFundsReply: status));
    }).catchError((err) {
      log.severe("Error in getFundStatus " + err.toString());
    });
  }

  Future _fetchFundStatusAction(FetchSwapFundStatus action) async {
    action.resolve(await _fetchFundStatus());    
  }

  Future _fetchRates(FetchRates rates) async {
    if (this._accountController.value.fiatConversionList.isEmpty) {
      await _getExchangeRate();  
    }
    rates.resolve(this._accountController.value.fiatConversionList);
  }

  _filterPayments(List<PaymentInfo> paymentsList) {
    Set<PaymentInfo> paymentsSet = paymentsList
        .where(
            (p) => _paymentFilterController.value.paymentType.contains(p.type))
        .toSet();
    if (_paymentFilterController.value.startDate != null &&
        _paymentFilterController.value.endDate != null) {
      Set<PaymentInfo> _dateFilteredPaymentsSet = paymentsList
          .where((p) => (p.creationTimestamp.toInt() * 1000 >=
                  _paymentFilterController
                      .value.startDate.millisecondsSinceEpoch &&
              p.creationTimestamp.toInt() * 1000 <=
                  _paymentFilterController
                      .value.endDate.millisecondsSinceEpoch))
          .toSet();
      return _dateFilteredPaymentsSet.intersection(paymentsSet).toList();
    }
    return paymentsSet.toList();
  }

  Future _getExchangeRate() async {    
    _currencyData = await _currencyService.currencies();
    Rates _rate = await _breezLib.rate();
    List<FiatConversion> _fiatConversionList = _rate.rates
        .map((rate) => new FiatConversion(_currencyData[rate.coin], rate.value))
        .toList();
    _fiatConversionList.sort((a, b) => a.currencyData.shortName.compareTo(b.currencyData.shortName));
    _accountController.add(_accountController.value
        .copyWith(
      fiatConversionList: _fiatConversionList,
      fiatShortName: _currentUser?.fiatCurrency,));
  }

  Future _handleResetNetwork(ResetNetwork action) async {
    action.resolve(await _breezLib.setPeers([]));    
  }

  Future _handleRestartDaemon(RestartDaemon action) async {
    action.resolve(await _breezLib.restartLightningDaemon());    
  }

  Future _handleSendQueryRoute(SendPaymentFailureReport action) async {
    action.resolve(await _breezLib.sendPaymentFailureBugReport(action.traceReport));        
  }

  Future _hanleAccountSettings() async {
    var preferences = await ServiceInjector().sharedPreferences;
    var accountSettings =
        preferences.getString(ACCOUNT_SETTINGS_PREFERENCES_KEY);
    if (accountSettings != null) {
      Map<String, dynamic> settings = json.decode(accountSettings);
      _accountSettingsController.add(AccountSettings.fromJson(settings));
    }
    _accountSettingsController.stream.listen((settings) {
      preferences.setString(
          ACCOUNT_SETTINGS_PREFERENCES_KEY, json.encode(settings.toJson()));
    });

    _accountController.stream.listen((acc) async {
      if (acc.id.isNotEmpty) {
        await preferences.setString(PERSISTENT_NODE_ID_PREFERENCES_KEY, acc.id);
      }
    });
  }

  bool _isBootstrapping() {
    return _sharedPreferences.get(BOOTSTRAPING_PREFERENCES_KEY) == true;
  }

  void _listenAccountActions() {
    _userActionsController.stream.listen((action) {
      var handler = _actionHandlers[action.runtimeType];
      if (handler != null) {
        handler(action).catchError((e) => action.resolveError(e));
      }
    });
  }

  void _listenAccountChanges() {
    StreamSubscription<NotificationEvent> eventSubscription;
    eventSubscription =
        Observable(_breezLib.notificationStream).listen((event) {
      if (event.type ==
          NotificationEvent_NotificationType.LIGHTNING_SERVICE_DOWN) {
            _pollSyncStatus();
            if (!_retryingLightningService) {
              _retryingLightningService = true;
              _breezLib.restartLightningDaemon();
              return;
            }
            _retryingLightningService = false;
            _lightningDownController.add(true);         
      }
      if (event.type == NotificationEvent_NotificationType.ACCOUNT_CHANGED) {
        _refreshAccount();
      }
      if (event.type ==
          NotificationEvent_NotificationType.BACKUP_NODE_CONFLICT) {
        eventSubscription.cancel();
        _nodeConflictController.add(null);
      }
    });
  }

  void _listenBootstrapStatus() {    
    _breezLib.chainBootstrapProgress.listen((fileInfo) {
      double totalContentLength = 0;
      double downloadedContentLength = 0;
      fileInfo.forEach((s, f) {
        totalContentLength += f.contentLength;
        downloadedContentLength += f.bytesDownloaded;
      });
      double progress = downloadedContentLength / totalContentLength;
      _accountController
          .add(_accountController.value.copyWith(bootstrapProgress: progress));      
    }, onDone: () {
      _accountController
          .add(_accountController.value.copyWith(bootstrapProgress: 1));
    });    
  }

  void _listenConnectivityChanges() {
    var connectivity = Connectivity();
    connectivity.onConnectivityChanged.skip(1).listen((connectivityResult) {
      log.info("_listenConnectivityChanges: connection changed to: " +
          connectivityResult.toString());
      _allowReconnect = (connectivityResult != ConnectivityResult.none);
      _reconnectSink.add(null);
    });
  }

  void _listenEnableAccount() {
    _accountEnableController.stream.listen((enable) {
      _accountController
          .add(_accountController.value.copyWith(enableInProgress: true));
      _breezLib.enableAccount(enable).whenComplete(() {
        _accountController
            .add(_accountController.value.copyWith(enableInProgress: false));
      });
    });
  }

  void _listenFilterChanges() {
    _paymentFilterController.stream.skip(1).listen((filter) {
      _refreshPayments();
    });
  }

  void _listenMempoolTransactions() {
    _notificationsService.notifications
        .where((message) =>
            message["msg"] == "Unconfirmed transaction" ||
            message["msg"] == "Confirmed transaction")
        .listen((message) {
      log.severe(message.toString());
      if (message["msg"] == "Unconfirmed transaction" &&
          message["user_click"] == null) {
        _accountNotificationsController.add(message["body"].toString());
      }
      _fetchFundStatus();
    });

    _device.eventStream.where((e) => e == NotificationType.RESUME).listen((e) {
      log.info("App Resumed - flutter resume called, adding reconnect request");
      _reconnectSink.add(null);
    });
  }

  void _listenReconnects() {
    Future connectingFuture = Future.value(null);
    _reconnectStreamController.stream
        .transform(DebounceStreamTransformer(Duration(milliseconds: 500)))
        .listen((_) async {
      connectingFuture = connectingFuture.whenComplete(() async {
        if (_allowReconnect == true &&
            _accountController.value.connected == false) {
          await _breezLib.connectAccount();
        }
      }).catchError((e) {});
    });
  }

  void _listenRefundableDeposits() {    
    _breezLib.notificationStream
        .where((n) =>
            n.type ==
            NotificationEvent_NotificationType.FUND_ADDRESS_UNSPENT_CHANGED)
        .listen((e) {      
      _fetchFundStatus();
    });
  }

  void _listenRefundBroadcasts() {
    _broadcastRefundRequestController.stream.listen((request) {
      _breezLib.refund(request.fromAddress, request.toAddress).then((txID) {
        _broadcastRefundResponseController
            .add(new BroadcastRefundResponseModel(request, txID));
      }).catchError(_broadcastRefundResponseController.addError);
    });
  }

  void _listenRoutingNodeConnectionChanges() {
    Observable(_breezLib.notificationStream)
        .where((event) =>
            event.type ==
            NotificationEvent_NotificationType.ROUTING_NODE_CONNECTION_CHANGED)
        .listen((change) => _refreshRoutingNodeConnection());
  }

  _listenUserChanges(Stream<BreezUserModel> userProfileStream) {
    userProfileStream.listen((user) async {
      if (user.token != _currentUser?.token) {
        print("user profile bloc registering for channel open notifications");
        _breezLib.registerChannelOpenedNotification(user.token);
      }
      _currentUser = user;

      //convert currency.
      _accountController.add(_accountController.value.copyWith(currency: user.currency));
      _accountController.add(_accountController.value.copyWith(fiatShortName: user.fiatCurrency));
      var updatedPayments = _paymentsController.value.copyWith(
        nonFilteredItems: _paymentsController.value.nonFilteredItems.map((p) => p.copyWith(user.currency)).toList(),
        paymentsList: _paymentsController.value.paymentsList.map((p) => p.copyWith(user.currency)).toList(),
      );
      _paymentsController.add(updatedPayments);

      //start lightning
      if (user.registered) {
        if (!_startedLightning) {
          _breezLib.needsBootstrap().then((need){
              _setBootstraping(need || _isBootstrapping());
          });
          //_askWhitelistOptimizations();
          print(
              "Account bloc got registered user, starting lightning daemon...");
          _startedLightning = true;
          _pollSyncStatus();          
          _backgroundService.runAsTask(_onBoardingCompleter.future, (){
            log.info("onboarding background task finished");
          });
          _bootstrapWitRetry().then((_) async {
            await _breezLib.startLightning();
            _breezLib.registerPeriodicSync(user.token);
            _fetchFundStatus();
            _listenConnectivityChanges();
            _listenReconnects();
            _listenRefundableDeposits();
            _updateExchangeRates();
            _listenRefundBroadcasts();
          });
        }
      }
    });
  }  

  void _listenWithdrawalRequests() {
    _withdrawalController.stream.listen((removeFundRequestModel) {
      Future removeFunds = Future.value(null);
      if (removeFundRequestModel.fromWallet) {
        removeFunds = _breezLib
            .sendWalletCoins(
                removeFundRequestModel.address,
                removeFundRequestModel.amount,
                removeFundRequestModel.satPerByteFee)
            .then((txID) => _withdrawalResultController
                .add(new RemoveFundResponseModel(txID)));
      } else {
        removeFunds = _breezLib
            .removeFund(
                removeFundRequestModel.address, removeFundRequestModel.amount)
            .then((res) => _withdrawalResultController.add(
                new RemoveFundResponseModel(res.txid,
                    errorMessage: res.errorMessage)));
      }

      removeFunds.catchError(_withdrawalResultController.addError);
    });
  }

  void _pollSyncStatus(){
    if (_accountSynchronizer != null) {
      _accountSynchronizer.dismiss();
    }

    _accountSynchronizer = new AccountSynchronizer(
      _breezLib, 
      onStart: (startPollTimestamp, bootstraping) async {
        if (
            bootstraping || Duration(milliseconds: DateTime.now().millisecondsSinceEpoch - startPollTimestamp) > Duration(days: 1) &&
            _accountController.value.syncUIState == SyncUIState.NONE) {
              await userProfileStream.where((u) => u.locked == false).first;
             _accountController.add(_accountController.value.copyWith(syncUIState: SyncUIState.BLOCKING));
          }
      },
      onProgress: (progress) => _accountController.add(_accountController.value.copyWith(syncProgress: progress)),
      onComplete: () => _accountController.add(_accountController.value.copyWith(syncUIState: SyncUIState.NONE, syncProgress: 1.0))
    );   
  }

  _refreshAccount() {
    print("Account bloc refreshing account...");
    _breezLib.getAccount().then((acc) {
      if (acc.id.isNotEmpty) {
        print("ACCOUNT CHANGED BALANCE=" +
            acc.balance.toString() +
            " STATUS = " +
            acc.status.toString());
        _accountController.add(_accountController.value
            .copyWith(accountResponse: acc, currency: _currentUser?.currency, fiatShortName: _currentUser?.fiatCurrency, initial: false));
      }
    }).catchError(_accountController.addError);
    _refreshPayments();
    if (_accountController.value.onChainFeeRate == null) {
      _breezLib.getDefaultOnChainFeeRate().then((rate) {
        if (rate.toInt() > 0) {
          _accountController
              .add(_accountController.value.copyWith(onChainFeeRate: rate));
        }
      });
    }
  }

  void _refreshPayments() {
    DateTime _firstDate;
    print("refreshing payments...");
    _breezLib.getPayments().then((payments) {
      List<PaymentInfo> _paymentsList = payments.paymentsList
          .map((payment) => new PaymentInfo(payment, _currentUser?.currency))
          .toList();
      if (_paymentsList.length > 0) {
        _firstDate = DateTime.fromMillisecondsSinceEpoch(
            _paymentsList.last.creationTimestamp.toInt() * 1000);
      }
      print("refresh payments finished");
      _paymentsController.add(PaymentsModel(
          _paymentsList,
          _filterPayments(_paymentsList),
          _paymentFilterController.value,
          _firstDate ?? DateTime(DateTime.now().year)));
    }).catchError(_paymentsController.addError);
  }

  _refreshRoutingNodeConnection() {
    _breezLib.isConnectedToRoutingNode().then((connected) async {
      _accountController
          .add(_accountController.value.copyWith(connected: connected));
      _setBootstraping(
          connected ? false : _accountController.value.bootstraping);
      if (!connected) {
        log.info("Node disconnected, adding reconnect request");
        _reconnectSink.add(null); //try to reconnect
      }
    }).catchError(_routingNodeConnectionController.addError);
  }

  Future _sendPayment(SendPayment sendPayment) {
    var payRequest = sendPayment.paymentRequest;
    _accountController.add(_accountController.value
          .copyWith(paymentRequestInProgress: payRequest.paymentRequest));
    var sendPaymentFuture = _breezLib
        .sendPaymentForRequest(payRequest.paymentRequest,
            amount: payRequest.amount)
        .then((response) {
      _accountController.add(
        _accountController.value.copyWith(paymentRequestInProgress: ""));

      if (response.paymentError.isNotEmpty) {         
        return Future.error(PaymentError(payRequest, response.paymentError, response.traceReport));
      }
      
      _completedPaymentsController.add(CompletedPayment(payRequest));
      return Future.value(null);

    }).catchError((err) {        
      _accountController.add(
          _accountController.value.copyWith(paymentRequestInProgress: ""));
      var error = (err.runtimeType == PaymentError ? err : PaymentError(payRequest, err, null));
      _completedPaymentsController
          .addError(error);
        return Future.error(error);
    });
    _backgroundService.runAsTask(sendPaymentFuture, (){
      log.info("sendpayment background task finished");
    });
    return sendPaymentFuture;
  }

  void _setBootstraping(bool bootstraping) async {
    _sharedPreferences.setBool(BOOTSTRAPING_PREFERENCES_KEY, bootstraping);
    bool initial = bootstraping ? false : _accountController.value.initial;
    _accountController
        .add(_accountController.value.copyWith(bootstraping: bootstraping, initial: initial));  
    if (bootstraping && _accountController.value.syncUIState == SyncUIState.NONE) {
      await userProfileStream.where((u) => u.locked == false).first;
      _accountController.add(_accountController.value.copyWith(syncUIState: SyncUIState.BLOCKING));
    }
  }

  _startExchangeRateTimer() {
    _exchangeRateTimer = Timer.periodic(Duration(seconds: 30), (_) async {
      _getExchangeRate();
    });
  }

  void _trackOnBoardingStatus(){
    _accountController.where((acc) => !acc.initial && !acc.isInitialBootstrap).first.then((_){
      _onBoardingCompleter.complete();
    });
  }

  _updateExchangeRates() {
    _getExchangeRate();
    _startExchangeRateTimer();
    SystemChannels.lifecycle.setMessageHandler((msg) {
      switch (msg) {
        case "AppLifecycleState.resumed":
          _getExchangeRate();
          _startExchangeRateTimer();
          break;
        default:
          // cancel timer when AppLifecycleState is paused, inactive or suspending
          _exchangeRateTimer?.cancel();
          break;
      }
    });
  }
}
