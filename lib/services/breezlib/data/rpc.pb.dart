///
//  Generated code. Do not modify.
//  source: rpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc.pbenum.dart';

export 'rpc.pbenum.dart';

class ChainStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChainStatus',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..a<$core.int>(1, 'blockHeight', $pb.PbFieldType.OU3,
        protoName: 'blockHeight')
    ..aOB(2, 'syncedToChain', protoName: 'syncedToChain')
    ..hasRequiredFields = false;

  ChainStatus._() : super();
  factory ChainStatus() => create();
  factory ChainStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChainStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ChainStatus clone() => ChainStatus()..mergeFromMessage(this);
  ChainStatus copyWith(void Function(ChainStatus) updates) =>
      super.copyWith((message) => updates(message as ChainStatus));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChainStatus create() => ChainStatus._();
  ChainStatus createEmptyInstance() => create();
  static $pb.PbList<ChainStatus> createRepeated() => $pb.PbList<ChainStatus>();
  @$core.pragma('dart2js:noInline')
  static ChainStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChainStatus>(create);
  static ChainStatus _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get blockHeight => $_getIZ(0);
  @$pb.TagNumber(1)
  set blockHeight($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBlockHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockHeight() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get syncedToChain => $_getBF(1);
  @$pb.TagNumber(2)
  set syncedToChain($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSyncedToChain() => $_has(1);
  @$pb.TagNumber(2)
  void clearSyncedToChain() => clearField(2);
}

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aInt64(2, 'balance')
    ..aInt64(3, 'walletBalance', protoName: 'walletBalance')
    ..e<Account_AccountStatus>(4, 'status', $pb.PbFieldType.OE,
        defaultOrMaker: Account_AccountStatus.DISCONNECTED,
        valueOf: Account_AccountStatus.valueOf,
        enumValues: Account_AccountStatus.values)
    ..aInt64(5, 'maxAllowedToReceive', protoName: 'maxAllowedToReceive')
    ..aInt64(6, 'maxAllowedToPay', protoName: 'maxAllowedToPay')
    ..aInt64(7, 'maxPaymentAmount', protoName: 'maxPaymentAmount')
    ..aInt64(8, 'routingNodeFee', protoName: 'routingNodeFee')
    ..aOB(9, 'enabled')
    ..aInt64(10, 'maxChanReserve', protoName: 'maxChanReserve')
    ..aOS(11, 'channelPoint', protoName: 'channelPoint')
    ..aOB(12, 'readyForPayments', protoName: 'readyForPayments')
    ..aInt64(13, 'tipHeight', protoName: 'tipHeight')
    ..hasRequiredFields = false;

  Account._() : super();
  factory Account() => create();
  factory Account.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Account clone() => Account()..mergeFromMessage(this);
  Account copyWith(void Function(Account) updates) =>
      super.copyWith((message) => updates(message as Account));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get balance => $_getI64(1);
  @$pb.TagNumber(2)
  set balance($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalance() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get walletBalance => $_getI64(2);
  @$pb.TagNumber(3)
  set walletBalance($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWalletBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearWalletBalance() => clearField(3);

  @$pb.TagNumber(4)
  Account_AccountStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(Account_AccountStatus v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get maxAllowedToReceive => $_getI64(4);
  @$pb.TagNumber(5)
  set maxAllowedToReceive($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMaxAllowedToReceive() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxAllowedToReceive() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get maxAllowedToPay => $_getI64(5);
  @$pb.TagNumber(6)
  set maxAllowedToPay($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMaxAllowedToPay() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxAllowedToPay() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get maxPaymentAmount => $_getI64(6);
  @$pb.TagNumber(7)
  set maxPaymentAmount($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMaxPaymentAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxPaymentAmount() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get routingNodeFee => $_getI64(7);
  @$pb.TagNumber(8)
  set routingNodeFee($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRoutingNodeFee() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoutingNodeFee() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get enabled => $_getBF(8);
  @$pb.TagNumber(9)
  set enabled($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEnabled() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnabled() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get maxChanReserve => $_getI64(9);
  @$pb.TagNumber(10)
  set maxChanReserve($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMaxChanReserve() => $_has(9);
  @$pb.TagNumber(10)
  void clearMaxChanReserve() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get channelPoint => $_getSZ(10);
  @$pb.TagNumber(11)
  set channelPoint($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasChannelPoint() => $_has(10);
  @$pb.TagNumber(11)
  void clearChannelPoint() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get readyForPayments => $_getBF(11);
  @$pb.TagNumber(12)
  set readyForPayments($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasReadyForPayments() => $_has(11);
  @$pb.TagNumber(12)
  void clearReadyForPayments() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get tipHeight => $_getI64(12);
  @$pb.TagNumber(13)
  set tipHeight($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTipHeight() => $_has(12);
  @$pb.TagNumber(13)
  void clearTipHeight() => clearField(13);
}

class Payment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Payment',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..e<Payment_PaymentType>(1, 'type', $pb.PbFieldType.OE,
        defaultOrMaker: Payment_PaymentType.DEPOSIT,
        valueOf: Payment_PaymentType.valueOf,
        enumValues: Payment_PaymentType.values)
    ..aInt64(3, 'amount')
    ..aInt64(4, 'creationTimestamp', protoName: 'creationTimestamp')
    ..aOM<InvoiceMemo>(6, 'invoiceMemo',
        protoName: 'invoiceMemo', subBuilder: InvoiceMemo.create)
    ..aOS(7, 'redeemTxID', protoName: 'redeemTxID')
    ..aOS(8, 'paymentHash', protoName: 'paymentHash')
    ..aOS(9, 'destination')
    ..a<$core.int>(10, 'PendingExpirationHeight', $pb.PbFieldType.OU3,
        protoName: 'PendingExpirationHeight')
    ..aInt64(11, 'PendingExpirationTimestamp',
        protoName: 'PendingExpirationTimestamp')
    ..aInt64(12, 'fee')
    ..aOS(13, 'preimage')
    ..aOS(14, 'closedChannelPoint', protoName: 'closedChannelPoint')
    ..aOB(15, 'isChannelPending', protoName: 'isChannelPending')
    ..aOB(16, 'isChannelCloseConfimed', protoName: 'isChannelCloseConfimed')
    ..aOS(17, 'closedChannelTxID', protoName: 'closedChannelTxID')
    ..hasRequiredFields = false;

  Payment._() : super();
  factory Payment() => create();
  factory Payment.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Payment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Payment clone() => Payment()..mergeFromMessage(this);
  Payment copyWith(void Function(Payment) updates) =>
      super.copyWith((message) => updates(message as Payment));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment _defaultInstance;

  @$pb.TagNumber(1)
  Payment_PaymentType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Payment_PaymentType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get creationTimestamp => $_getI64(2);
  @$pb.TagNumber(4)
  set creationTimestamp($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreationTimestamp() => $_has(2);
  @$pb.TagNumber(4)
  void clearCreationTimestamp() => clearField(4);

  @$pb.TagNumber(6)
  InvoiceMemo get invoiceMemo => $_getN(3);
  @$pb.TagNumber(6)
  set invoiceMemo(InvoiceMemo v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasInvoiceMemo() => $_has(3);
  @$pb.TagNumber(6)
  void clearInvoiceMemo() => clearField(6);
  @$pb.TagNumber(6)
  InvoiceMemo ensureInvoiceMemo() => $_ensure(3);

  @$pb.TagNumber(7)
  $core.String get redeemTxID => $_getSZ(4);
  @$pb.TagNumber(7)
  set redeemTxID($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRedeemTxID() => $_has(4);
  @$pb.TagNumber(7)
  void clearRedeemTxID() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get paymentHash => $_getSZ(5);
  @$pb.TagNumber(8)
  set paymentHash($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPaymentHash() => $_has(5);
  @$pb.TagNumber(8)
  void clearPaymentHash() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get destination => $_getSZ(6);
  @$pb.TagNumber(9)
  set destination($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDestination() => $_has(6);
  @$pb.TagNumber(9)
  void clearDestination() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get pendingExpirationHeight => $_getIZ(7);
  @$pb.TagNumber(10)
  set pendingExpirationHeight($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPendingExpirationHeight() => $_has(7);
  @$pb.TagNumber(10)
  void clearPendingExpirationHeight() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get pendingExpirationTimestamp => $_getI64(8);
  @$pb.TagNumber(11)
  set pendingExpirationTimestamp($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPendingExpirationTimestamp() => $_has(8);
  @$pb.TagNumber(11)
  void clearPendingExpirationTimestamp() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get fee => $_getI64(9);
  @$pb.TagNumber(12)
  set fee($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasFee() => $_has(9);
  @$pb.TagNumber(12)
  void clearFee() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get preimage => $_getSZ(10);
  @$pb.TagNumber(13)
  set preimage($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPreimage() => $_has(10);
  @$pb.TagNumber(13)
  void clearPreimage() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get closedChannelPoint => $_getSZ(11);
  @$pb.TagNumber(14)
  set closedChannelPoint($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasClosedChannelPoint() => $_has(11);
  @$pb.TagNumber(14)
  void clearClosedChannelPoint() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isChannelPending => $_getBF(12);
  @$pb.TagNumber(15)
  set isChannelPending($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasIsChannelPending() => $_has(12);
  @$pb.TagNumber(15)
  void clearIsChannelPending() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get isChannelCloseConfimed => $_getBF(13);
  @$pb.TagNumber(16)
  set isChannelCloseConfimed($core.bool v) {
    $_setBool(13, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIsChannelCloseConfimed() => $_has(13);
  @$pb.TagNumber(16)
  void clearIsChannelCloseConfimed() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get closedChannelTxID => $_getSZ(14);
  @$pb.TagNumber(17)
  set closedChannelTxID($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasClosedChannelTxID() => $_has(14);
  @$pb.TagNumber(17)
  void clearClosedChannelTxID() => clearField(17);
}

class PaymentsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PaymentsList',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..pc<Payment>(1, 'paymentsList', $pb.PbFieldType.PM,
        protoName: 'paymentsList', subBuilder: Payment.create)
    ..hasRequiredFields = false;

  PaymentsList._() : super();
  factory PaymentsList() => create();
  factory PaymentsList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaymentsList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PaymentsList clone() => PaymentsList()..mergeFromMessage(this);
  PaymentsList copyWith(void Function(PaymentsList) updates) =>
      super.copyWith((message) => updates(message as PaymentsList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentsList create() => PaymentsList._();
  PaymentsList createEmptyInstance() => create();
  static $pb.PbList<PaymentsList> createRepeated() =>
      $pb.PbList<PaymentsList>();
  @$core.pragma('dart2js:noInline')
  static PaymentsList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaymentsList>(create);
  static PaymentsList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Payment> get paymentsList => $_getList(0);
}

class PaymentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PaymentResponse',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'paymentError', protoName: 'paymentError')
    ..aOS(2, 'traceReport', protoName: 'traceReport')
    ..hasRequiredFields = false;

  PaymentResponse._() : super();
  factory PaymentResponse() => create();
  factory PaymentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PaymentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PaymentResponse clone() => PaymentResponse()..mergeFromMessage(this);
  PaymentResponse copyWith(void Function(PaymentResponse) updates) =>
      super.copyWith((message) => updates(message as PaymentResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentResponse create() => PaymentResponse._();
  PaymentResponse createEmptyInstance() => create();
  static $pb.PbList<PaymentResponse> createRepeated() =>
      $pb.PbList<PaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static PaymentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaymentResponse>(create);
  static PaymentResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentError => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentError($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPaymentError() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentError() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get traceReport => $_getSZ(1);
  @$pb.TagNumber(2)
  set traceReport($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTraceReport() => $_has(1);
  @$pb.TagNumber(2)
  void clearTraceReport() => clearField(2);
}

class SendWalletCoinsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendWalletCoinsRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aInt64(2, 'satPerByteFee', protoName: 'satPerByteFee')
    ..hasRequiredFields = false;

  SendWalletCoinsRequest._() : super();
  factory SendWalletCoinsRequest() => create();
  factory SendWalletCoinsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SendWalletCoinsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  SendWalletCoinsRequest clone() =>
      SendWalletCoinsRequest()..mergeFromMessage(this);
  SendWalletCoinsRequest copyWith(
          void Function(SendWalletCoinsRequest) updates) =>
      super.copyWith((message) => updates(message as SendWalletCoinsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendWalletCoinsRequest create() => SendWalletCoinsRequest._();
  SendWalletCoinsRequest createEmptyInstance() => create();
  static $pb.PbList<SendWalletCoinsRequest> createRepeated() =>
      $pb.PbList<SendWalletCoinsRequest>();
  @$core.pragma('dart2js:noInline')
  static SendWalletCoinsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendWalletCoinsRequest>(create);
  static SendWalletCoinsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get satPerByteFee => $_getI64(1);
  @$pb.TagNumber(2)
  set satPerByteFee($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSatPerByteFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearSatPerByteFee() => clearField(2);
}

class PayInvoiceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PayInvoiceRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aInt64(1, 'amount')
    ..aOS(2, 'paymentRequest', protoName: 'paymentRequest')
    ..hasRequiredFields = false;

  PayInvoiceRequest._() : super();
  factory PayInvoiceRequest() => create();
  factory PayInvoiceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PayInvoiceRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PayInvoiceRequest clone() => PayInvoiceRequest()..mergeFromMessage(this);
  PayInvoiceRequest copyWith(void Function(PayInvoiceRequest) updates) =>
      super.copyWith((message) => updates(message as PayInvoiceRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayInvoiceRequest create() => PayInvoiceRequest._();
  PayInvoiceRequest createEmptyInstance() => create();
  static $pb.PbList<PayInvoiceRequest> createRepeated() =>
      $pb.PbList<PayInvoiceRequest>();
  @$core.pragma('dart2js:noInline')
  static PayInvoiceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayInvoiceRequest>(create);
  static PayInvoiceRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentRequest => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentRequest($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPaymentRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentRequest() => clearField(2);
}

class InvoiceMemo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InvoiceMemo',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'description')
    ..aInt64(2, 'amount')
    ..aOS(3, 'payeeName', protoName: 'payeeName')
    ..aOS(4, 'payeeImageURL', protoName: 'payeeImageURL')
    ..aOS(5, 'payerName', protoName: 'payerName')
    ..aOS(6, 'payerImageURL', protoName: 'payerImageURL')
    ..aOB(7, 'transferRequest', protoName: 'transferRequest')
    ..aInt64(8, 'expiry')
    ..hasRequiredFields = false;

  InvoiceMemo._() : super();
  factory InvoiceMemo() => create();
  factory InvoiceMemo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvoiceMemo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  InvoiceMemo clone() => InvoiceMemo()..mergeFromMessage(this);
  InvoiceMemo copyWith(void Function(InvoiceMemo) updates) =>
      super.copyWith((message) => updates(message as InvoiceMemo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InvoiceMemo create() => InvoiceMemo._();
  InvoiceMemo createEmptyInstance() => create();
  static $pb.PbList<InvoiceMemo> createRepeated() => $pb.PbList<InvoiceMemo>();
  @$core.pragma('dart2js:noInline')
  static InvoiceMemo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvoiceMemo>(create);
  static InvoiceMemo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get payeeName => $_getSZ(2);
  @$pb.TagNumber(3)
  set payeeName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPayeeName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayeeName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get payeeImageURL => $_getSZ(3);
  @$pb.TagNumber(4)
  set payeeImageURL($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPayeeImageURL() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayeeImageURL() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get payerName => $_getSZ(4);
  @$pb.TagNumber(5)
  set payerName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPayerName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayerName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get payerImageURL => $_getSZ(5);
  @$pb.TagNumber(6)
  set payerImageURL($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPayerImageURL() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayerImageURL() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get transferRequest => $_getBF(6);
  @$pb.TagNumber(7)
  set transferRequest($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTransferRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransferRequest() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expiry => $_getI64(7);
  @$pb.TagNumber(8)
  set expiry($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasExpiry() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpiry() => clearField(8);
}

class Invoice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Invoice',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOM<InvoiceMemo>(1, 'memo', subBuilder: InvoiceMemo.create)
    ..aOB(2, 'settled')
    ..aInt64(3, 'amtPaid', protoName: 'amtPaid')
    ..hasRequiredFields = false;

  Invoice._() : super();
  factory Invoice() => create();
  factory Invoice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Invoice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Invoice clone() => Invoice()..mergeFromMessage(this);
  Invoice copyWith(void Function(Invoice) updates) =>
      super.copyWith((message) => updates(message as Invoice));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Invoice create() => Invoice._();
  Invoice createEmptyInstance() => create();
  static $pb.PbList<Invoice> createRepeated() => $pb.PbList<Invoice>();
  @$core.pragma('dart2js:noInline')
  static Invoice getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Invoice>(create);
  static Invoice _defaultInstance;

  @$pb.TagNumber(1)
  InvoiceMemo get memo => $_getN(0);
  @$pb.TagNumber(1)
  set memo(InvoiceMemo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMemo() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemo() => clearField(1);
  @$pb.TagNumber(1)
  InvoiceMemo ensureMemo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get settled => $_getBF(1);
  @$pb.TagNumber(2)
  set settled($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSettled() => $_has(1);
  @$pb.TagNumber(2)
  void clearSettled() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amtPaid => $_getI64(2);
  @$pb.TagNumber(3)
  set amtPaid($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAmtPaid() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmtPaid() => clearField(3);
}

class NotificationEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NotificationEvent',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..e<NotificationEvent_NotificationType>(1, 'type', $pb.PbFieldType.OE,
        defaultOrMaker: NotificationEvent_NotificationType.READY,
        valueOf: NotificationEvent_NotificationType.valueOf,
        enumValues: NotificationEvent_NotificationType.values)
    ..pPS(2, 'data')
    ..hasRequiredFields = false;

  NotificationEvent._() : super();
  factory NotificationEvent() => create();
  factory NotificationEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NotificationEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  NotificationEvent clone() => NotificationEvent()..mergeFromMessage(this);
  NotificationEvent copyWith(void Function(NotificationEvent) updates) =>
      super.copyWith((message) => updates(message as NotificationEvent));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotificationEvent create() => NotificationEvent._();
  NotificationEvent createEmptyInstance() => create();
  static $pb.PbList<NotificationEvent> createRepeated() =>
      $pb.PbList<NotificationEvent>();
  @$core.pragma('dart2js:noInline')
  static NotificationEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotificationEvent>(create);
  static NotificationEvent _defaultInstance;

  @$pb.TagNumber(1)
  NotificationEvent_NotificationType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(NotificationEvent_NotificationType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get data => $_getList(1);
}

class AddFundInitReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddFundInitReply',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aInt64(2, 'maxAllowedDeposit', protoName: 'maxAllowedDeposit')
    ..aOS(3, 'errorMessage', protoName: 'errorMessage')
    ..aOS(4, 'backupJson', protoName: 'backupJson')
    ..aInt64(5, 'requiredReserve', protoName: 'requiredReserve')
    ..hasRequiredFields = false;

  AddFundInitReply._() : super();
  factory AddFundInitReply() => create();
  factory AddFundInitReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddFundInitReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  AddFundInitReply clone() => AddFundInitReply()..mergeFromMessage(this);
  AddFundInitReply copyWith(void Function(AddFundInitReply) updates) =>
      super.copyWith((message) => updates(message as AddFundInitReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddFundInitReply create() => AddFundInitReply._();
  AddFundInitReply createEmptyInstance() => create();
  static $pb.PbList<AddFundInitReply> createRepeated() =>
      $pb.PbList<AddFundInitReply>();
  @$core.pragma('dart2js:noInline')
  static AddFundInitReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddFundInitReply>(create);
  static AddFundInitReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get maxAllowedDeposit => $_getI64(1);
  @$pb.TagNumber(2)
  set maxAllowedDeposit($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxAllowedDeposit() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxAllowedDeposit() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get backupJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set backupJson($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBackupJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackupJson() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get requiredReserve => $_getI64(4);
  @$pb.TagNumber(5)
  set requiredReserve($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRequiredReserve() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequiredReserve() => clearField(5);
}

class AddFundReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddFundReply',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false;

  AddFundReply._() : super();
  factory AddFundReply() => create();
  factory AddFundReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddFundReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  AddFundReply clone() => AddFundReply()..mergeFromMessage(this);
  AddFundReply copyWith(void Function(AddFundReply) updates) =>
      super.copyWith((message) => updates(message as AddFundReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddFundReply create() => AddFundReply._();
  AddFundReply createEmptyInstance() => create();
  static $pb.PbList<AddFundReply> createRepeated() =>
      $pb.PbList<AddFundReply>();
  @$core.pragma('dart2js:noInline')
  static AddFundReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddFundReply>(create);
  static AddFundReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMessage => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMessage($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasErrorMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMessage() => clearField(1);
}

class RefundRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RefundRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aOS(2, 'refundAddress', protoName: 'refundAddress')
    ..a<$core.int>(3, 'targetConf', $pb.PbFieldType.O3)
    ..aInt64(4, 'satPerByte')
    ..hasRequiredFields = false;

  RefundRequest._() : super();
  factory RefundRequest() => create();
  factory RefundRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefundRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RefundRequest clone() => RefundRequest()..mergeFromMessage(this);
  RefundRequest copyWith(void Function(RefundRequest) updates) =>
      super.copyWith((message) => updates(message as RefundRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefundRequest create() => RefundRequest._();
  RefundRequest createEmptyInstance() => create();
  static $pb.PbList<RefundRequest> createRepeated() =>
      $pb.PbList<RefundRequest>();
  @$core.pragma('dart2js:noInline')
  static RefundRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefundRequest>(create);
  static RefundRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refundAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set refundAddress($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRefundAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get targetConf => $_getIZ(2);
  @$pb.TagNumber(3)
  set targetConf($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTargetConf() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetConf() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get satPerByte => $_getI64(3);
  @$pb.TagNumber(4)
  set satPerByte($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSatPerByte() => $_has(3);
  @$pb.TagNumber(4)
  void clearSatPerByte() => clearField(4);
}

class AddFundError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddFundError',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOM<SwapAddressInfo>(1, 'swapAddressInfo',
        protoName: 'swapAddressInfo', subBuilder: SwapAddressInfo.create)
    ..a<$core.double>(2, 'hoursToUnlock', $pb.PbFieldType.OF,
        protoName: 'hoursToUnlock')
    ..hasRequiredFields = false;

  AddFundError._() : super();
  factory AddFundError() => create();
  factory AddFundError.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddFundError.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  AddFundError clone() => AddFundError()..mergeFromMessage(this);
  AddFundError copyWith(void Function(AddFundError) updates) =>
      super.copyWith((message) => updates(message as AddFundError));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddFundError create() => AddFundError._();
  AddFundError createEmptyInstance() => create();
  static $pb.PbList<AddFundError> createRepeated() =>
      $pb.PbList<AddFundError>();
  @$core.pragma('dart2js:noInline')
  static AddFundError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddFundError>(create);
  static AddFundError _defaultInstance;

  @$pb.TagNumber(1)
  SwapAddressInfo get swapAddressInfo => $_getN(0);
  @$pb.TagNumber(1)
  set swapAddressInfo(SwapAddressInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSwapAddressInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwapAddressInfo() => clearField(1);
  @$pb.TagNumber(1)
  SwapAddressInfo ensureSwapAddressInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get hoursToUnlock => $_getN(1);
  @$pb.TagNumber(2)
  set hoursToUnlock($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHoursToUnlock() => $_has(1);
  @$pb.TagNumber(2)
  void clearHoursToUnlock() => clearField(2);
}

class FundStatusReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FundStatusReply',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..pc<SwapAddressInfo>(1, 'unConfirmedAddresses', $pb.PbFieldType.PM,
        protoName: 'unConfirmedAddresses', subBuilder: SwapAddressInfo.create)
    ..pc<SwapAddressInfo>(2, 'confirmedAddresses', $pb.PbFieldType.PM,
        protoName: 'confirmedAddresses', subBuilder: SwapAddressInfo.create)
    ..pc<SwapAddressInfo>(3, 'refundableAddresses', $pb.PbFieldType.PM,
        protoName: 'refundableAddresses', subBuilder: SwapAddressInfo.create)
    ..hasRequiredFields = false;

  FundStatusReply._() : super();
  factory FundStatusReply() => create();
  factory FundStatusReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FundStatusReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  FundStatusReply clone() => FundStatusReply()..mergeFromMessage(this);
  FundStatusReply copyWith(void Function(FundStatusReply) updates) =>
      super.copyWith((message) => updates(message as FundStatusReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FundStatusReply create() => FundStatusReply._();
  FundStatusReply createEmptyInstance() => create();
  static $pb.PbList<FundStatusReply> createRepeated() =>
      $pb.PbList<FundStatusReply>();
  @$core.pragma('dart2js:noInline')
  static FundStatusReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FundStatusReply>(create);
  static FundStatusReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SwapAddressInfo> get unConfirmedAddresses => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SwapAddressInfo> get confirmedAddresses => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<SwapAddressInfo> get refundableAddresses => $_getList(2);
}

class RemoveFundRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RemoveFundRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aInt64(2, 'amount')
    ..hasRequiredFields = false;

  RemoveFundRequest._() : super();
  factory RemoveFundRequest() => create();
  factory RemoveFundRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RemoveFundRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RemoveFundRequest clone() => RemoveFundRequest()..mergeFromMessage(this);
  RemoveFundRequest copyWith(void Function(RemoveFundRequest) updates) =>
      super.copyWith((message) => updates(message as RemoveFundRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveFundRequest create() => RemoveFundRequest._();
  RemoveFundRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveFundRequest> createRepeated() =>
      $pb.PbList<RemoveFundRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveFundRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveFundRequest>(create);
  static RemoveFundRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
}

class RemoveFundReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RemoveFundReply',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'txid')
    ..aOS(2, 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false;

  RemoveFundReply._() : super();
  factory RemoveFundReply() => create();
  factory RemoveFundReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RemoveFundReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RemoveFundReply clone() => RemoveFundReply()..mergeFromMessage(this);
  RemoveFundReply copyWith(void Function(RemoveFundReply) updates) =>
      super.copyWith((message) => updates(message as RemoveFundReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveFundReply create() => RemoveFundReply._();
  RemoveFundReply createEmptyInstance() => create();
  static $pb.PbList<RemoveFundReply> createRepeated() =>
      $pb.PbList<RemoveFundReply>();
  @$core.pragma('dart2js:noInline')
  static RemoveFundReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveFundReply>(create);
  static RemoveFundReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txid => $_getSZ(0);
  @$pb.TagNumber(1)
  set txid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTxid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);
}

class SwapAddressInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SwapAddressInfo',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aOS(2, 'PaymentHash', protoName: 'PaymentHash')
    ..aInt64(3, 'ConfirmedAmount', protoName: 'ConfirmedAmount')
    ..pPS(4, 'ConfirmedTransactionIds', protoName: 'ConfirmedTransactionIds')
    ..aInt64(5, 'PaidAmount', protoName: 'PaidAmount')
    ..a<$core.int>(6, 'lockHeight', $pb.PbFieldType.OU3,
        protoName: 'lockHeight')
    ..aOS(7, 'errorMessage', protoName: 'errorMessage')
    ..aOS(8, 'lastRefundTxID', protoName: 'lastRefundTxID')
    ..e<SwapError>(9, 'swapError', $pb.PbFieldType.OE,
        protoName: 'swapError',
        defaultOrMaker: SwapError.NO_ERROR,
        valueOf: SwapError.valueOf,
        enumValues: SwapError.values)
    ..aOS(10, 'FundingTxID', protoName: 'FundingTxID')
    ..a<$core.double>(11, 'hoursToUnlock', $pb.PbFieldType.OF,
        protoName: 'hoursToUnlock')
    ..hasRequiredFields = false;

  SwapAddressInfo._() : super();
  factory SwapAddressInfo() => create();
  factory SwapAddressInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SwapAddressInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  SwapAddressInfo clone() => SwapAddressInfo()..mergeFromMessage(this);
  SwapAddressInfo copyWith(void Function(SwapAddressInfo) updates) =>
      super.copyWith((message) => updates(message as SwapAddressInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwapAddressInfo create() => SwapAddressInfo._();
  SwapAddressInfo createEmptyInstance() => create();
  static $pb.PbList<SwapAddressInfo> createRepeated() =>
      $pb.PbList<SwapAddressInfo>();
  @$core.pragma('dart2js:noInline')
  static SwapAddressInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SwapAddressInfo>(create);
  static SwapAddressInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentHash => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentHash($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPaymentHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentHash() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get confirmedAmount => $_getI64(2);
  @$pb.TagNumber(3)
  set confirmedAmount($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasConfirmedAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfirmedAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get confirmedTransactionIds => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get paidAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set paidAmount($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPaidAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaidAmount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get lockHeight => $_getIZ(5);
  @$pb.TagNumber(6)
  set lockHeight($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLockHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearLockHeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get errorMessage => $_getSZ(6);
  @$pb.TagNumber(7)
  set errorMessage($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasErrorMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearErrorMessage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get lastRefundTxID => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastRefundTxID($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLastRefundTxID() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastRefundTxID() => clearField(8);

  @$pb.TagNumber(9)
  SwapError get swapError => $_getN(8);
  @$pb.TagNumber(9)
  set swapError(SwapError v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSwapError() => $_has(8);
  @$pb.TagNumber(9)
  void clearSwapError() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get fundingTxID => $_getSZ(9);
  @$pb.TagNumber(10)
  set fundingTxID($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasFundingTxID() => $_has(9);
  @$pb.TagNumber(10)
  void clearFundingTxID() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get hoursToUnlock => $_getN(10);
  @$pb.TagNumber(11)
  set hoursToUnlock($core.double v) {
    $_setFloat(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasHoursToUnlock() => $_has(10);
  @$pb.TagNumber(11)
  void clearHoursToUnlock() => clearField(11);
}

class SwapAddressList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SwapAddressList',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..pc<SwapAddressInfo>(1, 'addresses', $pb.PbFieldType.PM,
        subBuilder: SwapAddressInfo.create)
    ..hasRequiredFields = false;

  SwapAddressList._() : super();
  factory SwapAddressList() => create();
  factory SwapAddressList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SwapAddressList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  SwapAddressList clone() => SwapAddressList()..mergeFromMessage(this);
  SwapAddressList copyWith(void Function(SwapAddressList) updates) =>
      super.copyWith((message) => updates(message as SwapAddressList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwapAddressList create() => SwapAddressList._();
  SwapAddressList createEmptyInstance() => create();
  static $pb.PbList<SwapAddressList> createRepeated() =>
      $pb.PbList<SwapAddressList>();
  @$core.pragma('dart2js:noInline')
  static SwapAddressList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SwapAddressList>(create);
  static SwapAddressList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SwapAddressInfo> get addresses => $_getList(0);
}

class CreateRatchetSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      'CreateRatchetSessionRequest',
      package: const $pb.PackageName('data'),
      createEmptyInstance: create)
    ..aOS(1, 'secret')
    ..aOS(2, 'remotePubKey', protoName: 'remotePubKey')
    ..aOS(3, 'sessionID', protoName: 'sessionID')
    ..a<$fixnum.Int64>(4, 'expiry', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  CreateRatchetSessionRequest._() : super();
  factory CreateRatchetSessionRequest() => create();
  factory CreateRatchetSessionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateRatchetSessionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CreateRatchetSessionRequest clone() =>
      CreateRatchetSessionRequest()..mergeFromMessage(this);
  CreateRatchetSessionRequest copyWith(
          void Function(CreateRatchetSessionRequest) updates) =>
      super.copyWith(
          (message) => updates(message as CreateRatchetSessionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRatchetSessionRequest create() =>
      CreateRatchetSessionRequest._();
  CreateRatchetSessionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRatchetSessionRequest> createRepeated() =>
      $pb.PbList<CreateRatchetSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRatchetSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRatchetSessionRequest>(create);
  static CreateRatchetSessionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secret => $_getSZ(0);
  @$pb.TagNumber(1)
  set secret($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSecret() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecret() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remotePubKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set remotePubKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRemotePubKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemotePubKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sessionID => $_getSZ(2);
  @$pb.TagNumber(3)
  set sessionID($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSessionID() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionID() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expiry => $_getI64(3);
  @$pb.TagNumber(4)
  set expiry($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExpiry() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiry() => clearField(4);
}

class CreateRatchetSessionReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateRatchetSessionReply',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'sessionID', protoName: 'sessionID')
    ..aOS(2, 'secret')
    ..aOS(3, 'pubKey', protoName: 'pubKey')
    ..hasRequiredFields = false;

  CreateRatchetSessionReply._() : super();
  factory CreateRatchetSessionReply() => create();
  factory CreateRatchetSessionReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateRatchetSessionReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CreateRatchetSessionReply clone() =>
      CreateRatchetSessionReply()..mergeFromMessage(this);
  CreateRatchetSessionReply copyWith(
          void Function(CreateRatchetSessionReply) updates) =>
      super
          .copyWith((message) => updates(message as CreateRatchetSessionReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRatchetSessionReply create() => CreateRatchetSessionReply._();
  CreateRatchetSessionReply createEmptyInstance() => create();
  static $pb.PbList<CreateRatchetSessionReply> createRepeated() =>
      $pb.PbList<CreateRatchetSessionReply>();
  @$core.pragma('dart2js:noInline')
  static CreateRatchetSessionReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRatchetSessionReply>(create);
  static CreateRatchetSessionReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secret => $_getSZ(1);
  @$pb.TagNumber(2)
  set secret($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecret() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pubKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set pubKey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubKey() => clearField(3);
}

class RatchetSessionInfoReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RatchetSessionInfoReply',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'sessionID', protoName: 'sessionID')
    ..aOB(2, 'initiated')
    ..aOS(3, 'userInfo', protoName: 'userInfo')
    ..hasRequiredFields = false;

  RatchetSessionInfoReply._() : super();
  factory RatchetSessionInfoReply() => create();
  factory RatchetSessionInfoReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RatchetSessionInfoReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RatchetSessionInfoReply clone() =>
      RatchetSessionInfoReply()..mergeFromMessage(this);
  RatchetSessionInfoReply copyWith(
          void Function(RatchetSessionInfoReply) updates) =>
      super.copyWith((message) => updates(message as RatchetSessionInfoReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RatchetSessionInfoReply create() => RatchetSessionInfoReply._();
  RatchetSessionInfoReply createEmptyInstance() => create();
  static $pb.PbList<RatchetSessionInfoReply> createRepeated() =>
      $pb.PbList<RatchetSessionInfoReply>();
  @$core.pragma('dart2js:noInline')
  static RatchetSessionInfoReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatchetSessionInfoReply>(create);
  static RatchetSessionInfoReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get initiated => $_getBF(1);
  @$pb.TagNumber(2)
  set initiated($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInitiated() => $_has(1);
  @$pb.TagNumber(2)
  void clearInitiated() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userInfo => $_getSZ(2);
  @$pb.TagNumber(3)
  set userInfo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserInfo() => clearField(3);
}

class RatchetSessionSetInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      'RatchetSessionSetInfoRequest',
      package: const $pb.PackageName('data'),
      createEmptyInstance: create)
    ..aOS(1, 'sessionID', protoName: 'sessionID')
    ..aOS(2, 'userInfo', protoName: 'userInfo')
    ..hasRequiredFields = false;

  RatchetSessionSetInfoRequest._() : super();
  factory RatchetSessionSetInfoRequest() => create();
  factory RatchetSessionSetInfoRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RatchetSessionSetInfoRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RatchetSessionSetInfoRequest clone() =>
      RatchetSessionSetInfoRequest()..mergeFromMessage(this);
  RatchetSessionSetInfoRequest copyWith(
          void Function(RatchetSessionSetInfoRequest) updates) =>
      super.copyWith(
          (message) => updates(message as RatchetSessionSetInfoRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RatchetSessionSetInfoRequest create() =>
      RatchetSessionSetInfoRequest._();
  RatchetSessionSetInfoRequest createEmptyInstance() => create();
  static $pb.PbList<RatchetSessionSetInfoRequest> createRepeated() =>
      $pb.PbList<RatchetSessionSetInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static RatchetSessionSetInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatchetSessionSetInfoRequest>(create);
  static RatchetSessionSetInfoRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userInfo => $_getSZ(1);
  @$pb.TagNumber(2)
  set userInfo($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => clearField(2);
}

class RatchetEncryptRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RatchetEncryptRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'sessionID', protoName: 'sessionID')
    ..aOS(2, 'message')
    ..hasRequiredFields = false;

  RatchetEncryptRequest._() : super();
  factory RatchetEncryptRequest() => create();
  factory RatchetEncryptRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RatchetEncryptRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RatchetEncryptRequest clone() =>
      RatchetEncryptRequest()..mergeFromMessage(this);
  RatchetEncryptRequest copyWith(
          void Function(RatchetEncryptRequest) updates) =>
      super.copyWith((message) => updates(message as RatchetEncryptRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RatchetEncryptRequest create() => RatchetEncryptRequest._();
  RatchetEncryptRequest createEmptyInstance() => create();
  static $pb.PbList<RatchetEncryptRequest> createRepeated() =>
      $pb.PbList<RatchetEncryptRequest>();
  @$core.pragma('dart2js:noInline')
  static RatchetEncryptRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatchetEncryptRequest>(create);
  static RatchetEncryptRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RatchetDecryptRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RatchetDecryptRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'sessionID', protoName: 'sessionID')
    ..aOS(2, 'encryptedMessage', protoName: 'encryptedMessage')
    ..hasRequiredFields = false;

  RatchetDecryptRequest._() : super();
  factory RatchetDecryptRequest() => create();
  factory RatchetDecryptRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RatchetDecryptRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  RatchetDecryptRequest clone() =>
      RatchetDecryptRequest()..mergeFromMessage(this);
  RatchetDecryptRequest copyWith(
          void Function(RatchetDecryptRequest) updates) =>
      super.copyWith((message) => updates(message as RatchetDecryptRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RatchetDecryptRequest create() => RatchetDecryptRequest._();
  RatchetDecryptRequest createEmptyInstance() => create();
  static $pb.PbList<RatchetDecryptRequest> createRepeated() =>
      $pb.PbList<RatchetDecryptRequest>();
  @$core.pragma('dart2js:noInline')
  static RatchetDecryptRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatchetDecryptRequest>(create);
  static RatchetDecryptRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get encryptedMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set encryptedMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEncryptedMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncryptedMessage() => clearField(2);
}

class BootstrapFilesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BootstrapFilesRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'WorkingDir', protoName: 'WorkingDir')
    ..pPS(2, 'FullPaths', protoName: 'FullPaths')
    ..hasRequiredFields = false;

  BootstrapFilesRequest._() : super();
  factory BootstrapFilesRequest() => create();
  factory BootstrapFilesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BootstrapFilesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  BootstrapFilesRequest clone() =>
      BootstrapFilesRequest()..mergeFromMessage(this);
  BootstrapFilesRequest copyWith(
          void Function(BootstrapFilesRequest) updates) =>
      super.copyWith((message) => updates(message as BootstrapFilesRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BootstrapFilesRequest create() => BootstrapFilesRequest._();
  BootstrapFilesRequest createEmptyInstance() => create();
  static $pb.PbList<BootstrapFilesRequest> createRepeated() =>
      $pb.PbList<BootstrapFilesRequest>();
  @$core.pragma('dart2js:noInline')
  static BootstrapFilesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BootstrapFilesRequest>(create);
  static BootstrapFilesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workingDir => $_getSZ(0);
  @$pb.TagNumber(1)
  set workingDir($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWorkingDir() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkingDir() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get fullPaths => $_getList(1);
}

class Peers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Peers',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOB(1, 'isDefault', protoName: 'isDefault')
    ..pPS(2, 'peer')
    ..hasRequiredFields = false;

  Peers._() : super();
  factory Peers() => create();
  factory Peers.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Peers.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Peers clone() => Peers()..mergeFromMessage(this);
  Peers copyWith(void Function(Peers) updates) =>
      super.copyWith((message) => updates(message as Peers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Peers create() => Peers._();
  Peers createEmptyInstance() => create();
  static $pb.PbList<Peers> createRepeated() => $pb.PbList<Peers>();
  @$core.pragma('dart2js:noInline')
  static Peers getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Peers>(create);
  static Peers _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isDefault => $_getBF(0);
  @$pb.TagNumber(1)
  set isDefault($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsDefault() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsDefault() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get peer => $_getList(1);
}

class TxSpentURL extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TxSpentURL',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'URL', protoName: 'URL')
    ..aOB(2, 'isDefault', protoName: 'isDefault')
    ..aOB(3, 'disabled')
    ..hasRequiredFields = false;

  TxSpentURL._() : super();
  factory TxSpentURL() => create();
  factory TxSpentURL.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TxSpentURL.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  TxSpentURL clone() => TxSpentURL()..mergeFromMessage(this);
  TxSpentURL copyWith(void Function(TxSpentURL) updates) =>
      super.copyWith((message) => updates(message as TxSpentURL));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TxSpentURL create() => TxSpentURL._();
  TxSpentURL createEmptyInstance() => create();
  static $pb.PbList<TxSpentURL> createRepeated() => $pb.PbList<TxSpentURL>();
  @$core.pragma('dart2js:noInline')
  static TxSpentURL getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TxSpentURL>(create);
  static TxSpentURL _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uRL => $_getSZ(0);
  @$pb.TagNumber(1)
  set uRL($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasURL() => $_has(0);
  @$pb.TagNumber(1)
  void clearURL() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isDefault => $_getBF(1);
  @$pb.TagNumber(2)
  set isDefault($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsDefault() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsDefault() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get disabled => $_getBF(2);
  @$pb.TagNumber(3)
  set disabled($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDisabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisabled() => clearField(3);
}

class rate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('rate',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'coin')
    ..a<$core.double>(2, 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  rate._() : super();
  factory rate() => create();
  factory rate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory rate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  rate clone() => rate()..mergeFromMessage(this);
  rate copyWith(void Function(rate) updates) =>
      super.copyWith((message) => updates(message as rate));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static rate create() => rate._();
  rate createEmptyInstance() => create();
  static $pb.PbList<rate> createRepeated() => $pb.PbList<rate>();
  @$core.pragma('dart2js:noInline')
  static rate getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<rate>(create);
  static rate _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coin => $_getSZ(0);
  @$pb.TagNumber(1)
  set coin($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoin() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Rates extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Rates',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..pc<rate>(1, 'rates', $pb.PbFieldType.PM, subBuilder: rate.create)
    ..hasRequiredFields = false;

  Rates._() : super();
  factory Rates() => create();
  factory Rates.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Rates.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Rates clone() => Rates()..mergeFromMessage(this);
  Rates copyWith(void Function(Rates) updates) =>
      super.copyWith((message) => updates(message as Rates));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rates create() => Rates._();
  Rates createEmptyInstance() => create();
  static $pb.PbList<Rates> createRepeated() => $pb.PbList<Rates>();
  @$core.pragma('dart2js:noInline')
  static Rates getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rates>(create);
  static Rates _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<rate> get rates => $_getList(0);
}

class LSPInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LSPInformation',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'widgetUrl')
    ..aOS(3, 'pubkey')
    ..aOS(4, 'host')
    ..aInt64(5, 'channelCapacity')
    ..a<$core.int>(6, 'targetConf', $pb.PbFieldType.O3)
    ..aInt64(7, 'baseFeeMsat')
    ..a<$core.double>(8, 'feeRate', $pb.PbFieldType.OD)
    ..a<$core.int>(9, 'timeLockDelta', $pb.PbFieldType.OU3)
    ..aInt64(10, 'minHtlcMsat')
    ..hasRequiredFields = false;

  LSPInformation._() : super();
  factory LSPInformation() => create();
  factory LSPInformation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LSPInformation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  LSPInformation clone() => LSPInformation()..mergeFromMessage(this);
  LSPInformation copyWith(void Function(LSPInformation) updates) =>
      super.copyWith((message) => updates(message as LSPInformation));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LSPInformation create() => LSPInformation._();
  LSPInformation createEmptyInstance() => create();
  static $pb.PbList<LSPInformation> createRepeated() =>
      $pb.PbList<LSPInformation>();
  @$core.pragma('dart2js:noInline')
  static LSPInformation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LSPInformation>(create);
  static LSPInformation _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get widgetUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set widgetUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWidgetUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidgetUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pubkey => $_getSZ(2);
  @$pb.TagNumber(3)
  set pubkey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPubkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubkey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get host => $_getSZ(3);
  @$pb.TagNumber(4)
  set host($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHost() => $_has(3);
  @$pb.TagNumber(4)
  void clearHost() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get channelCapacity => $_getI64(4);
  @$pb.TagNumber(5)
  set channelCapacity($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasChannelCapacity() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannelCapacity() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get targetConf => $_getIZ(5);
  @$pb.TagNumber(6)
  set targetConf($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTargetConf() => $_has(5);
  @$pb.TagNumber(6)
  void clearTargetConf() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get baseFeeMsat => $_getI64(6);
  @$pb.TagNumber(7)
  set baseFeeMsat($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBaseFeeMsat() => $_has(6);
  @$pb.TagNumber(7)
  void clearBaseFeeMsat() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get feeRate => $_getN(7);
  @$pb.TagNumber(8)
  set feeRate($core.double v) {
    $_setDouble(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFeeRate() => $_has(7);
  @$pb.TagNumber(8)
  void clearFeeRate() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get timeLockDelta => $_getIZ(8);
  @$pb.TagNumber(9)
  set timeLockDelta($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTimeLockDelta() => $_has(8);
  @$pb.TagNumber(9)
  void clearTimeLockDelta() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get minHtlcMsat => $_getI64(9);
  @$pb.TagNumber(10)
  set minHtlcMsat($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMinHtlcMsat() => $_has(9);
  @$pb.TagNumber(10)
  void clearMinHtlcMsat() => clearField(10);
}

class LSPList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LSPList',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..m<$core.String, LSPInformation>(1, 'lsps',
        entryClassName: 'LSPList.LspsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: LSPInformation.create,
        packageName: const $pb.PackageName('data'))
    ..hasRequiredFields = false;

  LSPList._() : super();
  factory LSPList() => create();
  factory LSPList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LSPList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  LSPList clone() => LSPList()..mergeFromMessage(this);
  LSPList copyWith(void Function(LSPList) updates) =>
      super.copyWith((message) => updates(message as LSPList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LSPList create() => LSPList._();
  LSPList createEmptyInstance() => create();
  static $pb.PbList<LSPList> createRepeated() => $pb.PbList<LSPList>();
  @$core.pragma('dart2js:noInline')
  static LSPList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LSPList>(create);
  static LSPList _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, LSPInformation> get lsps => $_getMap(0);
}

enum LNUrlResponse_Action { withdraw, channel, notSet }

class LNUrlResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, LNUrlResponse_Action>
      _LNUrlResponse_ActionByTag = {
    1: LNUrlResponse_Action.withdraw,
    2: LNUrlResponse_Action.channel,
    0: LNUrlResponse_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LNUrlResponse',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<LNUrlWithdraw>(1, 'withdraw', subBuilder: LNUrlWithdraw.create)
    ..aOM<LNURLChannel>(2, 'channel', subBuilder: LNURLChannel.create)
    ..hasRequiredFields = false;

  LNUrlResponse._() : super();
  factory LNUrlResponse() => create();
  factory LNUrlResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LNUrlResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  LNUrlResponse clone() => LNUrlResponse()..mergeFromMessage(this);
  LNUrlResponse copyWith(void Function(LNUrlResponse) updates) =>
      super.copyWith((message) => updates(message as LNUrlResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LNUrlResponse create() => LNUrlResponse._();
  LNUrlResponse createEmptyInstance() => create();
  static $pb.PbList<LNUrlResponse> createRepeated() =>
      $pb.PbList<LNUrlResponse>();
  @$core.pragma('dart2js:noInline')
  static LNUrlResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LNUrlResponse>(create);
  static LNUrlResponse _defaultInstance;

  LNUrlResponse_Action whichAction() =>
      _LNUrlResponse_ActionByTag[$_whichOneof(0)];
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LNUrlWithdraw get withdraw => $_getN(0);
  @$pb.TagNumber(1)
  set withdraw(LNUrlWithdraw v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWithdraw() => $_has(0);
  @$pb.TagNumber(1)
  void clearWithdraw() => clearField(1);
  @$pb.TagNumber(1)
  LNUrlWithdraw ensureWithdraw() => $_ensure(0);

  @$pb.TagNumber(2)
  LNURLChannel get channel => $_getN(1);
  @$pb.TagNumber(2)
  set channel(LNURLChannel v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannel() => clearField(2);
  @$pb.TagNumber(2)
  LNURLChannel ensureChannel() => $_ensure(1);
}

class LNUrlWithdraw extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LNUrlWithdraw',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aInt64(1, 'minAmount')
    ..aInt64(2, 'maxAmount')
    ..aOS(3, 'defaultDescription')
    ..hasRequiredFields = false;

  LNUrlWithdraw._() : super();
  factory LNUrlWithdraw() => create();
  factory LNUrlWithdraw.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LNUrlWithdraw.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  LNUrlWithdraw clone() => LNUrlWithdraw()..mergeFromMessage(this);
  LNUrlWithdraw copyWith(void Function(LNUrlWithdraw) updates) =>
      super.copyWith((message) => updates(message as LNUrlWithdraw));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LNUrlWithdraw create() => LNUrlWithdraw._();
  LNUrlWithdraw createEmptyInstance() => create();
  static $pb.PbList<LNUrlWithdraw> createRepeated() =>
      $pb.PbList<LNUrlWithdraw>();
  @$core.pragma('dart2js:noInline')
  static LNUrlWithdraw getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LNUrlWithdraw>(create);
  static LNUrlWithdraw _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get minAmount => $_getI64(0);
  @$pb.TagNumber(1)
  set minAmount($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMinAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinAmount() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get maxAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set maxAmount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get defaultDescription => $_getSZ(2);
  @$pb.TagNumber(3)
  set defaultDescription($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultDescription() => clearField(3);
}

class LNURLChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LNURLChannel',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'k1')
    ..aOS(2, 'callback')
    ..aOS(3, 'uri')
    ..hasRequiredFields = false;

  LNURLChannel._() : super();
  factory LNURLChannel() => create();
  factory LNURLChannel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LNURLChannel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  LNURLChannel clone() => LNURLChannel()..mergeFromMessage(this);
  LNURLChannel copyWith(void Function(LNURLChannel) updates) =>
      super.copyWith((message) => updates(message as LNURLChannel));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LNURLChannel create() => LNURLChannel._();
  LNURLChannel createEmptyInstance() => create();
  static $pb.PbList<LNURLChannel> createRepeated() =>
      $pb.PbList<LNURLChannel>();
  @$core.pragma('dart2js:noInline')
  static LNURLChannel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LNURLChannel>(create);
  static LNURLChannel _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get k1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set k1($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasK1() => $_has(0);
  @$pb.TagNumber(1)
  void clearK1() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get callback => $_getSZ(1);
  @$pb.TagNumber(2)
  set callback($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCallback() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallback() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uri => $_getSZ(2);
  @$pb.TagNumber(3)
  set uri($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearUri() => clearField(3);
}

class ReverseSwapRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwapRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aInt64(2, 'amount')
    ..hasRequiredFields = false;

  ReverseSwapRequest._() : super();
  factory ReverseSwapRequest() => create();
  factory ReverseSwapRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapRequest clone() => ReverseSwapRequest()..mergeFromMessage(this);
  ReverseSwapRequest copyWith(void Function(ReverseSwapRequest) updates) =>
      super.copyWith((message) => updates(message as ReverseSwapRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapRequest create() => ReverseSwapRequest._();
  ReverseSwapRequest createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapRequest> createRepeated() =>
      $pb.PbList<ReverseSwapRequest>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapRequest>(create);
  static ReverseSwapRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
}

class ReverseSwap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwap',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'invoice')
    ..aOS(3, 'script')
    ..aOS(4, 'lockupAddress')
    ..aOS(5, 'preimage')
    ..aOS(6, 'key')
    ..aOS(7, 'claimAddress')
    ..aInt64(8, 'lnAmount')
    ..aInt64(9, 'onchainAmount')
    ..aInt64(10, 'timeoutBlockHeight')
    ..aInt64(11, 'startBlockHeight')
    ..aInt64(12, 'claimFee')
    ..aOS(13, 'claimTxid')
    ..hasRequiredFields = false;

  ReverseSwap._() : super();
  factory ReverseSwap() => create();
  factory ReverseSwap.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwap.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwap clone() => ReverseSwap()..mergeFromMessage(this);
  ReverseSwap copyWith(void Function(ReverseSwap) updates) =>
      super.copyWith((message) => updates(message as ReverseSwap));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwap create() => ReverseSwap._();
  ReverseSwap createEmptyInstance() => create();
  static $pb.PbList<ReverseSwap> createRepeated() => $pb.PbList<ReverseSwap>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwap getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwap>(create);
  static ReverseSwap _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get invoice => $_getSZ(1);
  @$pb.TagNumber(2)
  set invoice($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInvoice() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvoice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get script => $_getSZ(2);
  @$pb.TagNumber(3)
  set script($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScript() => $_has(2);
  @$pb.TagNumber(3)
  void clearScript() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lockupAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set lockupAddress($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLockupAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockupAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get preimage => $_getSZ(4);
  @$pb.TagNumber(5)
  set preimage($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPreimage() => $_has(4);
  @$pb.TagNumber(5)
  void clearPreimage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get key => $_getSZ(5);
  @$pb.TagNumber(6)
  set key($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearKey() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get claimAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set claimAddress($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasClaimAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearClaimAddress() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lnAmount => $_getI64(7);
  @$pb.TagNumber(8)
  set lnAmount($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLnAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearLnAmount() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get onchainAmount => $_getI64(8);
  @$pb.TagNumber(9)
  set onchainAmount($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnchainAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnchainAmount() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get timeoutBlockHeight => $_getI64(9);
  @$pb.TagNumber(10)
  set timeoutBlockHeight($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTimeoutBlockHeight() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimeoutBlockHeight() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get startBlockHeight => $_getI64(10);
  @$pb.TagNumber(11)
  set startBlockHeight($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStartBlockHeight() => $_has(10);
  @$pb.TagNumber(11)
  void clearStartBlockHeight() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get claimFee => $_getI64(11);
  @$pb.TagNumber(12)
  set claimFee($fixnum.Int64 v) {
    $_setInt64(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasClaimFee() => $_has(11);
  @$pb.TagNumber(12)
  void clearClaimFee() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get claimTxid => $_getSZ(12);
  @$pb.TagNumber(13)
  set claimTxid($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasClaimTxid() => $_has(12);
  @$pb.TagNumber(13)
  void clearClaimTxid() => clearField(13);
}

class ReverseSwapFees extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwapFees',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..a<$core.double>(1, 'percentage', $pb.PbFieldType.OD)
    ..aInt64(2, 'lockup')
    ..aInt64(3, 'claim')
    ..hasRequiredFields = false;

  ReverseSwapFees._() : super();
  factory ReverseSwapFees() => create();
  factory ReverseSwapFees.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapFees.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapFees clone() => ReverseSwapFees()..mergeFromMessage(this);
  ReverseSwapFees copyWith(void Function(ReverseSwapFees) updates) =>
      super.copyWith((message) => updates(message as ReverseSwapFees));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapFees create() => ReverseSwapFees._();
  ReverseSwapFees createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapFees> createRepeated() =>
      $pb.PbList<ReverseSwapFees>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapFees getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapFees>(create);
  static ReverseSwapFees _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get percentage => $_getN(0);
  @$pb.TagNumber(1)
  set percentage($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPercentage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercentage() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lockup => $_getI64(1);
  @$pb.TagNumber(2)
  set lockup($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLockup() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockup() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get claim => $_getI64(2);
  @$pb.TagNumber(3)
  set claim($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasClaim() => $_has(2);
  @$pb.TagNumber(3)
  void clearClaim() => clearField(3);
}

class ReverseSwapInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwapInfo',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aInt64(1, 'min')
    ..aInt64(2, 'max')
    ..aOM<ReverseSwapFees>(3, 'fees', subBuilder: ReverseSwapFees.create)
    ..hasRequiredFields = false;

  ReverseSwapInfo._() : super();
  factory ReverseSwapInfo() => create();
  factory ReverseSwapInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapInfo clone() => ReverseSwapInfo()..mergeFromMessage(this);
  ReverseSwapInfo copyWith(void Function(ReverseSwapInfo) updates) =>
      super.copyWith((message) => updates(message as ReverseSwapInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapInfo create() => ReverseSwapInfo._();
  ReverseSwapInfo createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapInfo> createRepeated() =>
      $pb.PbList<ReverseSwapInfo>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapInfo>(create);
  static ReverseSwapInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get min => $_getI64(0);
  @$pb.TagNumber(1)
  set min($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get max => $_getI64(1);
  @$pb.TagNumber(2)
  set max($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearMax() => clearField(2);

  @$pb.TagNumber(3)
  ReverseSwapFees get fees => $_getN(2);
  @$pb.TagNumber(3)
  set fees(ReverseSwapFees v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFees() => $_has(2);
  @$pb.TagNumber(3)
  void clearFees() => clearField(3);
  @$pb.TagNumber(3)
  ReverseSwapFees ensureFees() => $_ensure(2);
}

class ReverseSwapPaymentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwapPaymentRequest',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'hash')
    ..aOM<PushNotificationDetails>(2, 'pushNotificationDetails',
        subBuilder: PushNotificationDetails.create)
    ..hasRequiredFields = false;

  ReverseSwapPaymentRequest._() : super();
  factory ReverseSwapPaymentRequest() => create();
  factory ReverseSwapPaymentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapPaymentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapPaymentRequest clone() =>
      ReverseSwapPaymentRequest()..mergeFromMessage(this);
  ReverseSwapPaymentRequest copyWith(
          void Function(ReverseSwapPaymentRequest) updates) =>
      super
          .copyWith((message) => updates(message as ReverseSwapPaymentRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapPaymentRequest create() => ReverseSwapPaymentRequest._();
  ReverseSwapPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapPaymentRequest> createRepeated() =>
      $pb.PbList<ReverseSwapPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapPaymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapPaymentRequest>(create);
  static ReverseSwapPaymentRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  PushNotificationDetails get pushNotificationDetails => $_getN(1);
  @$pb.TagNumber(2)
  set pushNotificationDetails(PushNotificationDetails v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPushNotificationDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearPushNotificationDetails() => clearField(2);
  @$pb.TagNumber(2)
  PushNotificationDetails ensurePushNotificationDetails() => $_ensure(1);
}

class PushNotificationDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PushNotificationDetails',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'deviceId')
    ..aOS(2, 'title')
    ..aOS(3, 'body')
    ..hasRequiredFields = false;

  PushNotificationDetails._() : super();
  factory PushNotificationDetails() => create();
  factory PushNotificationDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PushNotificationDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PushNotificationDetails clone() =>
      PushNotificationDetails()..mergeFromMessage(this);
  PushNotificationDetails copyWith(
          void Function(PushNotificationDetails) updates) =>
      super.copyWith((message) => updates(message as PushNotificationDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PushNotificationDetails create() => PushNotificationDetails._();
  PushNotificationDetails createEmptyInstance() => create();
  static $pb.PbList<PushNotificationDetails> createRepeated() =>
      $pb.PbList<PushNotificationDetails>();
  @$core.pragma('dart2js:noInline')
  static PushNotificationDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PushNotificationDetails>(create);
  static PushNotificationDetails _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);
}

class ReverseSwapPaymentStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwapPaymentStatus',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'hash')
    ..a<$core.int>(3, 'eta', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ReverseSwapPaymentStatus._() : super();
  factory ReverseSwapPaymentStatus() => create();
  factory ReverseSwapPaymentStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapPaymentStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapPaymentStatus clone() =>
      ReverseSwapPaymentStatus()..mergeFromMessage(this);
  ReverseSwapPaymentStatus copyWith(
          void Function(ReverseSwapPaymentStatus) updates) =>
      super.copyWith((message) => updates(message as ReverseSwapPaymentStatus));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapPaymentStatus create() => ReverseSwapPaymentStatus._();
  ReverseSwapPaymentStatus createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapPaymentStatus> createRepeated() =>
      $pb.PbList<ReverseSwapPaymentStatus>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapPaymentStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapPaymentStatus>(create);
  static ReverseSwapPaymentStatus _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get eta => $_getIZ(1);
  @$pb.TagNumber(3)
  set eta($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEta() => $_has(1);
  @$pb.TagNumber(3)
  void clearEta() => clearField(3);
}

class ReverseSwapPaymentStatuses extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      'ReverseSwapPaymentStatuses',
      package: const $pb.PackageName('data'),
      createEmptyInstance: create)
    ..pc<ReverseSwapPaymentStatus>(1, 'paymentsStatus', $pb.PbFieldType.PM,
        subBuilder: ReverseSwapPaymentStatus.create)
    ..hasRequiredFields = false;

  ReverseSwapPaymentStatuses._() : super();
  factory ReverseSwapPaymentStatuses() => create();
  factory ReverseSwapPaymentStatuses.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapPaymentStatuses.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapPaymentStatuses clone() =>
      ReverseSwapPaymentStatuses()..mergeFromMessage(this);
  ReverseSwapPaymentStatuses copyWith(
          void Function(ReverseSwapPaymentStatuses) updates) =>
      super.copyWith(
          (message) => updates(message as ReverseSwapPaymentStatuses));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapPaymentStatuses create() => ReverseSwapPaymentStatuses._();
  ReverseSwapPaymentStatuses createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapPaymentStatuses> createRepeated() =>
      $pb.PbList<ReverseSwapPaymentStatuses>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapPaymentStatuses getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapPaymentStatuses>(create);
  static ReverseSwapPaymentStatuses _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ReverseSwapPaymentStatus> get paymentsStatus => $_getList(0);
}

class ReverseSwapClaimFee extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReverseSwapClaimFee',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aOS(1, 'hash')
    ..aInt64(2, 'fee')
    ..hasRequiredFields = false;

  ReverseSwapClaimFee._() : super();
  factory ReverseSwapClaimFee() => create();
  factory ReverseSwapClaimFee.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReverseSwapClaimFee.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ReverseSwapClaimFee clone() => ReverseSwapClaimFee()..mergeFromMessage(this);
  ReverseSwapClaimFee copyWith(void Function(ReverseSwapClaimFee) updates) =>
      super.copyWith((message) => updates(message as ReverseSwapClaimFee));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReverseSwapClaimFee create() => ReverseSwapClaimFee._();
  ReverseSwapClaimFee createEmptyInstance() => create();
  static $pb.PbList<ReverseSwapClaimFee> createRepeated() =>
      $pb.PbList<ReverseSwapClaimFee>();
  @$core.pragma('dart2js:noInline')
  static ReverseSwapClaimFee getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverseSwapClaimFee>(create);
  static ReverseSwapClaimFee _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => clearField(2);
}

class ClaimFeeEstimates extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClaimFeeEstimates',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..m<$core.int, $fixnum.Int64>(1, 'fees',
        entryClassName: 'ClaimFeeEstimates.FeesEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.O6,
        packageName: const $pb.PackageName('data'))
    ..hasRequiredFields = false;

  ClaimFeeEstimates._() : super();
  factory ClaimFeeEstimates() => create();
  factory ClaimFeeEstimates.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClaimFeeEstimates.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ClaimFeeEstimates clone() => ClaimFeeEstimates()..mergeFromMessage(this);
  ClaimFeeEstimates copyWith(void Function(ClaimFeeEstimates) updates) =>
      super.copyWith((message) => updates(message as ClaimFeeEstimates));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClaimFeeEstimates create() => ClaimFeeEstimates._();
  ClaimFeeEstimates createEmptyInstance() => create();
  static $pb.PbList<ClaimFeeEstimates> createRepeated() =>
      $pb.PbList<ClaimFeeEstimates>();
  @$core.pragma('dart2js:noInline')
  static ClaimFeeEstimates getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimFeeEstimates>(create);
  static ClaimFeeEstimates _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, $fixnum.Int64> get fees => $_getMap(0);
}

class UnspendLockupInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UnspendLockupInformation',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..a<$core.int>(1, 'heightHint', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(2, 'lockupScript', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'claimTxHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  UnspendLockupInformation._() : super();
  factory UnspendLockupInformation() => create();
  factory UnspendLockupInformation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnspendLockupInformation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  UnspendLockupInformation clone() =>
      UnspendLockupInformation()..mergeFromMessage(this);
  UnspendLockupInformation copyWith(
          void Function(UnspendLockupInformation) updates) =>
      super.copyWith((message) => updates(message as UnspendLockupInformation));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnspendLockupInformation create() => UnspendLockupInformation._();
  UnspendLockupInformation createEmptyInstance() => create();
  static $pb.PbList<UnspendLockupInformation> createRepeated() =>
      $pb.PbList<UnspendLockupInformation>();
  @$core.pragma('dart2js:noInline')
  static UnspendLockupInformation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnspendLockupInformation>(create);
  static UnspendLockupInformation _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get heightHint => $_getIZ(0);
  @$pb.TagNumber(1)
  set heightHint($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHeightHint() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeightHint() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get lockupScript => $_getN(1);
  @$pb.TagNumber(2)
  set lockupScript($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLockupScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockupScript() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get claimTxHash => $_getN(2);
  @$pb.TagNumber(3)
  set claimTxHash($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasClaimTxHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearClaimTxHash() => clearField(3);
}

class TransactionDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionDetails',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'tx', $pb.PbFieldType.OY)
    ..aOS(2, 'txHash')
    ..aInt64(3, 'fees')
    ..hasRequiredFields = false;

  TransactionDetails._() : super();
  factory TransactionDetails() => create();
  factory TransactionDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  TransactionDetails clone() => TransactionDetails()..mergeFromMessage(this);
  TransactionDetails copyWith(void Function(TransactionDetails) updates) =>
      super.copyWith((message) => updates(message as TransactionDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionDetails create() => TransactionDetails._();
  TransactionDetails createEmptyInstance() => create();
  static $pb.PbList<TransactionDetails> createRepeated() =>
      $pb.PbList<TransactionDetails>();
  @$core.pragma('dart2js:noInline')
  static TransactionDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionDetails>(create);
  static TransactionDetails _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get tx => $_getN(0);
  @$pb.TagNumber(1)
  set tx($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearTx() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get txHash => $_getSZ(1);
  @$pb.TagNumber(2)
  set txHash($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxHash() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get fees => $_getI64(2);
  @$pb.TagNumber(3)
  set fees($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFees() => $_has(2);
  @$pb.TagNumber(3)
  void clearFees() => clearField(3);
}

class SweepAllCoinsTransactions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SweepAllCoinsTransactions',
      package: const $pb.PackageName('data'), createEmptyInstance: create)
    ..aInt64(1, 'amt')
    ..m<$core.int, TransactionDetails>(2, 'transactions',
        entryClassName: 'SweepAllCoinsTransactions.TransactionsEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: TransactionDetails.create,
        packageName: const $pb.PackageName('data'))
    ..hasRequiredFields = false;

  SweepAllCoinsTransactions._() : super();
  factory SweepAllCoinsTransactions() => create();
  factory SweepAllCoinsTransactions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweepAllCoinsTransactions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  SweepAllCoinsTransactions clone() =>
      SweepAllCoinsTransactions()..mergeFromMessage(this);
  SweepAllCoinsTransactions copyWith(
          void Function(SweepAllCoinsTransactions) updates) =>
      super
          .copyWith((message) => updates(message as SweepAllCoinsTransactions));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweepAllCoinsTransactions create() => SweepAllCoinsTransactions._();
  SweepAllCoinsTransactions createEmptyInstance() => create();
  static $pb.PbList<SweepAllCoinsTransactions> createRepeated() =>
      $pb.PbList<SweepAllCoinsTransactions>();
  @$core.pragma('dart2js:noInline')
  static SweepAllCoinsTransactions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweepAllCoinsTransactions>(create);
  static SweepAllCoinsTransactions _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amt => $_getI64(0);
  @$pb.TagNumber(1)
  set amt($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAmt() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmt() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.int, TransactionDetails> get transactions => $_getMap(1);
}
