// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatTokenResponse _$ChatTokenResponseFromJson(Map<String, dynamic> json) =>
    ChatTokenResponse(
      data: json['data'] == null
          ? null
          : ConversationInfoModel.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$ChatTokenResponseToJson(ChatTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
