// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterOtpRequest _$RegisterOtpRequestFromJson(Map<String, dynamic> json) =>
    RegisterOtpRequest(
      json['email'] as String,
      json['code'] as String,
    );

Map<String, dynamic> _$RegisterOtpRequestToJson(RegisterOtpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
