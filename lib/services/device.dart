import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_extend/share_extend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Device {
  static const EventChannel _notificationsChannel =
      const EventChannel('com.breez.client/lifecycle_events_notifications');
  static const MethodChannel _breezShareChannel =
      const MethodChannel('com.breez.client/share_breez');

  static const String LAST_CLIPPING_PREFERENCES_KEY = "lastClipping";
  final StreamController _eventsController =
      new StreamController<NotificationType>.broadcast();

  final _deviceClipboardController = new BehaviorSubject<String>();
  String _lastClipping = "";

  Device() {
    var sharedPrefrences = SharedPreferences.getInstance();
    sharedPrefrences.then((preferences) {
      _lastClipping = preferences.getString(LAST_CLIPPING_PREFERENCES_KEY) ?? "";
      fetchClipboard(preferences);
    });

    _notificationsChannel.receiveBroadcastStream().listen((event) {
      if (event == "resume") {
        _eventsController.add(NotificationType.RESUME);
        sharedPrefrences.then((preferences) {
          fetchClipboard(preferences);
        });        
      }
      if (event == "pause") {
        _eventsController.add(NotificationType.PAUSE);
      }
    });
  }
  Stream get deviceClipboardStream => _deviceClipboardController.stream;

  Stream<NotificationType> get eventStream => _eventsController.stream;

  fetchClipboard(SharedPreferences preferences){
    Clipboard.getData("text/plain").then((clipboardData) {
      if (clipboardData != null) {
        var text = clipboardData.text;

        if (text != _lastClipping) {
          _deviceClipboardController.add(text);
          preferences.setString(LAST_CLIPPING_PREFERENCES_KEY, text);
          _lastClipping = text;
        }
      }
    });
  }

  Future shareText(String text) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _breezShareChannel.invokeMethod("share", {"text": text});
    }
    return ShareExtend.share(text, "text");
  }
}

enum NotificationType { RESUME, PAUSE }
