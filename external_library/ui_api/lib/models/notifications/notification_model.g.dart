// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      displayImage: json['display_image'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      isRead: json['is_read'] as int?,
      content: json['content'] as String?,
      displayType: json['display_type'] as int?,
      invoiceId: json['invoice_id'] as int?,
      typeLink: json['type_link'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'display_image': instance.displayImage,
      'created_at': instance.createdAt,
      'is_read': instance.isRead,
      'content': instance.content,
      'display_type': instance.displayType,
      'invoice_id': instance.invoiceId,
      'type_link': instance.typeLink,
    };
