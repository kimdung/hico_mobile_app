import 'package:json_annotation/json_annotation.dart';

part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData {
  static const String typeDefault = '1';
  static const String typeSupplierReviewProfile = '2';
  static const String typeSupplierAgreeCustomer = '3';
  static const String typeSupplierCancel = '4';
  static const String typeSupplierNewInvoice = '5';
  static const String typeCustomerCancel = '6';
  static const String typeCustomerExtendPeriod = '7';
  static const String typeSupplierCompleted = '8';
  static const String typeTravelingCosts = '9';
  static const String typeTimeReminder = '10';
  static const String typeAdminApproved = '11';
  static const String typeSystemStart = '12';
  static const String typeSendNotifyTimeout = '13';
  static const String typeAdminApprovedWallet = '14';
  static const String typeIncomingCall = '15';
  static const String typeMissedCall = '16';
  static const String typeSupplierOvertime = '17';
  static const String typeSystemCancel = '18';
  static const String typeSystemSendBefore10 = '19';
  static const String typeSystemSendBefore5 = '20';
  static const String typeSupplierAgreeExtend = '21';
  static const String typeSupplierRefuseExtend = '22';
  static const String typeSupplierRefuseCustomer = '23';
  static const String typeAdminTransferUser = '24';
  static const String typeCustomerCreateInvoice = '25';
  static const String typeUrlLink = '26';
  static const String typeNews = '27';
  static const String typePromotion = '28';

  @JsonKey(name: 'display_type')
  String? displayType;
  @JsonKey(name: 'invoice_id')
  String? invoiceId;
  @JsonKey(name: 'caller_id')
  String? callerId;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  dynamic id;
  String? avatar;
  String? name;
  String? sender;
  @JsonKey(name: 'channel_id')
  String? channelId;
  String? callId; 
  String? callIsVideo;
  String? callerName;
  String? callerPic;

  NotificationData({
    this.displayType,
    this.invoiceId,
    this.callerId,
    this.receiverId,
    this.id,
    this.avatar,
    this.name,
    this.sender,
    this.channelId,
    this.callId,
    this.callIsVideo,
    this.callerName,
    this.callerPic,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return _$NotificationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
