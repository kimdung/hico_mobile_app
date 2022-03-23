// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationInfoModel _$ConversationInfoModelFromJson(
        Map<String, dynamic> json) =>
    ConversationInfoModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      adminId: json['admin_id'] as String? ?? '',
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ConversationInfoModelToJson(
        ConversationInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'admin_id': instance.adminId,
      'token': instance.token,
    };
