import 'dart:async';

import 'package:breez/services/breez_server/server.dart';
import 'package:breez/services/breezlib/breez_bridge.dart';
import 'package:breez/services/currency_service.dart';
import 'package:breez/services/deep_links.dart';
import 'package:breez/services/device.dart';
import 'package:breez/services/lightning_links.dart';
import 'package:breez/services/nfc.dart';
import 'package:breez/services/notifications.dart';
import 'package:breez/services/permissions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'background_task.dart';

class ServiceInjector {
  static final _singleton = new ServiceInjector._internal();
  static ServiceInjector _injector;

  BreezServer _breezServer;  
  FirebaseNotifications _notifications;
  BreezBridge _breezBridge;
  NFCService _nfcService;
  DeepLinksService _deepLinksService;
  LightningLinksService _lightningLinksService;
  Device _device;
  Future<SharedPreferences> _sharedPreferences;
  Permissions _permissions;
  BackgroundTaskService _backroundTaskService;
  CurrencyService _currencyService;

  factory ServiceInjector() {
    return _injector != null ? _injector : _singleton;
  }

  ServiceInjector._internal();

  BackgroundTaskService get backgroundTaskService {
    return _backroundTaskService ??= BackgroundTaskService();
  }

  BreezBridge get breezBridge {
    return _breezBridge ??= new BreezBridge();
  }

  BreezServer get breezServer {
    return _breezServer ??= new BreezServer();
  }

  CurrencyService get currencyService {
    return _currencyService ??= CurrencyService();
  }

  DeepLinksService get deepLinks => _deepLinksService ??= new DeepLinksService();

  Device get device {
    return _device ??= Device();
  }

  LightningLinksService get lightningLinks => _lightningLinksService ??= new LightningLinksService();
  NFCService get nfc {
    return _nfcService ??= new NFCService();
  }

  Notifications get notifications {
    return _notifications ??= FirebaseNotifications();
  }     

  Permissions get permissions  {
    return _permissions ??= Permissions();
  }

  Future<SharedPreferences> get sharedPreferences => _sharedPreferences ??= SharedPreferences.getInstance();

  static void configure(ServiceInjector injector) {
    _injector = injector;
  }
}
