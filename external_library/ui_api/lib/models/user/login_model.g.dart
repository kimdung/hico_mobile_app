// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      accessToken: json['access_token'] as String?,
      info: json['info'] == null
          ? null
          : UserInfoModel.fromJson(json['info'] as Map<String, dynamic>),
    )..isResend = json['is_resend'] as int?;

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'is_resend': instance.isResend,
      'info': instance.info,
    };
