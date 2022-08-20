// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_unread_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationUnreadResponse _$NotificationUnreadResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationUnreadResponse(
      data: json['data'] as int?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$NotificationUnreadResponseToJson(
        NotificationUnreadResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
