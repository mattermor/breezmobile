library breez.logger;

import 'dart:async';
import 'dart:io';

import 'package:breez/services/breezlib/breez_bridge.dart';
import 'package:breez/services/injector.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:share_extend/share_extend.dart';

const _platform = const MethodChannel('com.breez.client/share_breez_log');
final Logger log = new Logger('Breez');

Future<File> get _logFile async {
  var logPath = await ServiceInjector().breezBridge.getLogPath();
  return File(logPath);
}

Future shareFile(String filePath){
  return ShareExtend.share(filePath, "file");  
}

void shareLog() {
  _logFile.then((file) {
    ShareExtend.share(file.path, "file");    
  });
}

class BreezLogger {
  BreezLogger() {
    BreezBridge breezBridge = ServiceInjector().breezBridge;
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      breezBridge.log(rec.message, rec.level.name);      
    });
  }
}
