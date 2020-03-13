import 'dart:async';

import 'package:breez/bloc/status_indicator/status_update_model.dart';
import 'package:rxdart/rxdart.dart';

class StatusIndicatorBloc {
  final _statusUpdateController = BehaviorSubject<StatusUpdateModel>();

  Sink<StatusUpdateModel> get statusUpdateSink => _statusUpdateController.sink;

  final _statusIndicatorUpdatesController = BehaviorSubject<String>();

  Stream<String> get statusIndicatorUpdatesStream =>
      _statusIndicatorUpdatesController.stream.asBroadcastStream();

  StatusIndicatorBloc() {
    _listenStatusUpdates();
  }

  void _listenStatusUpdates() {
    _statusUpdateController.stream.listen((update) {
      if (update == null) {
        _blankOutStatusIndicator();
      } else {
        _statusIndicatorUpdatesController.add(update.message);
      }
    });
  }

  void _blankOutStatusIndicator() {
    _statusIndicatorUpdatesController.add("");
  }

  close() {
    _statusUpdateController.close();
    _statusIndicatorUpdatesController.close();
  }
}
