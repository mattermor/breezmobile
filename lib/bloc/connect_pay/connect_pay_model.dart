/*
This model represents the state of the payment session for both sides.
*/
import 'package:fixnum/fixnum.dart';

class PayeeSessionData {
  final String userName;
  final String imageURL;
  final PeerStatus status;
  final String paymentRequest;
  final String error;
  final bool cancelled;
  PayeeSessionData(this.userName, this.imageURL, this.status, this.paymentRequest, this.error, this.cancelled);

  PayeeSessionData.fromJson(Map<dynamic, dynamic> json)
      : status = json['status'] == null ? null : PeerStatus.fromJson(json['status']),
        paymentRequest = json['paymentRequest'],
        userName = json["userName"],
        error = json["error"],
        cancelled = json["cancelled"] ?? false,
        imageURL = json['imageURL'];

  bool get invitationAccepted => status.lastChanged != 0;

  PayeeSessionData copyWith({String userName, String imageURL, PeerStatus status, String paymentRequest, String error, bool cancelled}) {
    return new PayeeSessionData(userName ?? this.userName, imageURL ?? this.imageURL, status ?? this.status, paymentRequest ?? this.paymentRequest, error ?? this.error, cancelled ?? this.cancelled);
  }  
}

class PayerSessionData {
  final String userName;
  final String imageURL;
  final PeerStatus status;
  final int amount;
  final String description;
  final String error;
  final bool cancelled;
  final bool paymentFulfilled;

  PayerSessionData(this.userName, this.imageURL, this.status, this.amount, this.description, {this.error, this.paymentFulfilled = false, this.cancelled = false});
  PayerSessionData.fromJson(Map<dynamic, dynamic> json)
      : status = json['status'] == null ? null : PeerStatus.fromJson(json['status']),
        amount = json['amount'] != null ? int.parse(json['amount'].toString()) : null,
        description = json['description'],
        userName = json["userName"],
        imageURL = json["imageURL"],
        error = json["error"],
        cancelled = json["cancelled"] ?? false,
        paymentFulfilled = json["paymentFulfilled"] ?? false;

  PayerSessionData copyWith({String userName, String imageURL, PeerStatus status, int amount, String description, String error, bool paymentFulfilled}) {
    return new PayerSessionData(userName ?? this.userName, imageURL ?? this.imageURL, status ?? this.status, 
        amount ?? this.amount, description ?? this.description, error: error ?? this.error, paymentFulfilled: paymentFulfilled ?? this.paymentFulfilled, cancelled: cancelled ?? this.cancelled);
  }  
}

class PaymentDetails {
  final Int64 amount;
  final String description;

  PaymentDetails(this.amount, this.description);
}

class PaymentSessionError {
  final PaymentSessionErrorType type;
  final String description;
  
  PaymentSessionError(this.type, this.description);
  PaymentSessionError.unknown(this.description) : type = PaymentSessionErrorType.UNKNOWN;
}

enum PaymentSessionErrorType {
  PAYER_CANCELLED,
  UNKNOWN
}

class PaymentSessionState {
  static const Duration connectionEmulationDuration = Duration(milliseconds:  1500);
  final bool payer;
  final String sessionSecret;
  final PayerSessionData payerData;
  final PayeeSessionData payeeData;
  final bool invitationReady;
  final bool invitationSent;
  final bool paymentFulfilled;  
  final int settledAmount;

  PaymentSessionState(this.payer, this.sessionSecret, this.payerData, this.payeeData, this.invitationReady, this.invitationSent, this.paymentFulfilled, this.settledAmount);  

  PaymentSessionState.payeeStart(String sessionSecret, String userName, String imageURL)
      : this(false, sessionSecret, PayerSessionData(null, null, PeerStatus.start(), null, null), PayeeSessionData(userName, imageURL, PeerStatus.start(), null, null, false), true, true,
            false, 0);

  PaymentSessionState.payerStart(String sessionSecret, String userName, String imageURL)
      : this(true, sessionSecret, PayerSessionData(userName, imageURL, PeerStatus.start(), null, null), PayeeSessionData(null, null, PeerStatus.start(), null, null, false),false,  false,
            false, 0);

  bool get remotePartyCancelled => payer ? payeeData.cancelled : payerData.cancelled;
  PaymentSessionState copyWith({PayerSessionData payerData, PayeeSessionData payeeData, bool invitationReady, bool invitationSent, bool paymentFulfilled, int settledAmount}) {
    return new PaymentSessionState(this.payer, this.sessionSecret, payerData ?? this.payerData, payeeData ?? this.payeeData, invitationReady ?? this.invitationReady,
        invitationSent ?? this.invitationSent, paymentFulfilled ?? this.paymentFulfilled, settledAmount ?? this.settledAmount);
  }
}

class PeerStatus {
  final bool online;
  final int lastChanged;

  PeerStatus(this.online, this.lastChanged);
  PeerStatus.fromJson(Map<dynamic, dynamic> json)
      : online = json['online'] ?? false,
        lastChanged = json['lastChanged'] ?? 0;

  PeerStatus.start()
      : online = false,
        lastChanged = 0;
}