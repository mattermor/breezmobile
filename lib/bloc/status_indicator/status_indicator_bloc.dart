import 'dart:async';

import 'package:breez/bloc/status_indicator/status_update_model.dart';
import 'package:rxdart/rxdart.dart';

class StatusIndicatorBloc {
  final _statusUpdateController = BehaviorSubject<StatusUpdateModel>();
  final _statusIndicatorUpdatesController = new BehaviorSubject<String>();

  bool _showingMessage = false;
  StatusUpdatePriority _currentMessagePriority;

  StatusIndicatorBloc() {
    _listenStatusUpdates();
  }
  Stream<String> get statusIndicatorUpdatesStream =>
      _statusIndicatorUpdatesController.stream.asBroadcastStream();

  Sink<StatusUpdateModel> get statusUpdateSink => _statusUpdateController.sink;

  close() {
    _statusUpdateController.close();
    _statusIndicatorUpdatesController.close();
  }

  void _blankOutStatusIndicator() {
    _showingMessage = false;
    _statusIndicatorUpdatesController.add("");
  }

  void _listenStatusUpdates() {
    _statusUpdateController.stream.listen((update) {
      if (update == null) {
        _blankOutStatusIndicator();
      } else {
        _statusIndicatorUpdatesController.add(update.message);
        _showingMessage = true;
        _currentMessagePriority = update.priority;
      }
    });
  }
}
