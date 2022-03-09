// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changepass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePassRequest _$ChangePassRequestFromJson(Map<String, dynamic> json) =>
    ChangePassRequest(
      json['old_password'] as String? ?? '',
      json['new_password'] as String? ?? '',
    );

Map<String, dynamic> _$ChangePassRequestToJson(ChangePassRequest instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
    };
