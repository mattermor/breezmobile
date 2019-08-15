import 'dart:async';

import 'package:breez/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseNotifications implements Notifications {
  
  FirebaseMessaging _firebaseMessaging;

  final StreamController<Map<dynamic, dynamic>> _notificationController = new BehaviorSubject<Map<dynamic, dynamic>>();
  FirebaseNotifications() {    
    _firebaseMessaging = new FirebaseMessaging();
    _firebaseMessaging.configure(
      onMessage: _onMessage,
      onResume: _onResume,
      onLaunch: _onResume
    );
  }

  Stream<Map<dynamic, dynamic>> get notifications => _notificationController.stream;

  @override
  Future<String> getToken() {
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    return _firebaseMessaging.getToken();
  }

  Future<dynamic> _onMessage(Map<String, dynamic> message) {
    log.info("_onMessage = " + message.toString());     
    var data = message["data"] ?? message["aps"] ?? message;
    if (data != null) {
      _notificationController.add(data);
    }
    return null;
  }

  Future<dynamic> _onResume(Map<String, dynamic> message) { 
    log.info("_onResume = " + message.toString());    
    var data = message["data"] ?? message;
    if (data != null) {
      _notificationController.add(data);
    }    
    return null;
  }

}


abstract class Notifications {
    Stream<Map<dynamic, dynamic>> get notifications;
    Future<String> getToken();
}