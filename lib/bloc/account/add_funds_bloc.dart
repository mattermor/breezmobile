
import 'dart:async';

import 'package:breez/bloc/account/account_model.dart';
import 'package:breez/services/breezlib/breez_bridge.dart';
import 'package:breez/services/injector.dart';

class AddFundsBloc {
  final _addFundRequestController = new StreamController<void>();
  final _addFundResponseController = new StreamController<AddFundResponse>();

  AddFundsBloc(String userID){
    BreezBridge breezLib = new ServiceInjector().breezBridge;
    _addFundRequestController.stream.listen((request){
      _addFundResponseController.add(null);
        breezLib.addFundsInit(userID)
          .then((reply) => _addFundResponseController.add(new AddFundResponse(reply)))
          .catchError(_addFundResponseController.addError);
      })
      .onDone(_dispose);
  }
  Sink<void> get addFundRequestSink => _addFundRequestController.sink;

  Stream<AddFundResponse> get addFundResponseStream => _addFundResponseController.stream;

  _dispose(){
    _addFundRequestController.close();
    _addFundResponseController.close();
  }
}