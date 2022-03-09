// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactRequest _$ContactRequestFromJson(Map<String, dynamic> json) =>
    ContactRequest(
      json['name'] as String,
      json['email'] as String,
      json['phone_number'] as String? ?? '',
      json['content'] as String,
    );

Map<String, dynamic> _$ContactRequestToJson(ContactRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'content': instance.content,
    };
