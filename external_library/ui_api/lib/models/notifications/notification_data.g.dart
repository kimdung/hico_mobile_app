// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      displayType: json['display_type'] as String?,
      invoiceId: json['invoice_id'] as String?,
      callerId: json['caller_id'] as String?,
      receiverId: json['receiver_id'] as String?,
      id: json['id'],
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      sender: json['sender'] as String?,
      channelId: json['channel_id'] as String?,
      callId: json['callId'] as String?,
      callIsVideo: json['callIsVideo'] as String?,
      callerName: json['callerName'] as String?,
      callerPic: json['callerPic'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'display_type': instance.displayType,
      'invoice_id': instance.invoiceId,
      'caller_id': instance.callerId,
      'receiver_id': instance.receiverId,
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'sender': instance.sender,
      'channel_id': instance.channelId,
      'callId': instance.callId,
      'callIsVideo': instance.callIsVideo,
      'callerName': instance.callerName,
      'callerPic': instance.callerPic,
    };
