import 'package:json_annotation/json_annotation.dart';

part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData {
  static const String typeIncomingCall = '15';

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

  NotificationData({
    this.displayType,
    this.invoiceId,
    this.callerId,
    this.receiverId,
    this.id,
    this.avatar,
    this.name,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return _$NotificationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
