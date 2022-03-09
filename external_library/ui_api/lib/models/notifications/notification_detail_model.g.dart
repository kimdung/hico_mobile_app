// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDetailModel _$NotificationDetailModelFromJson(
        Map<String, dynamic> json) =>
    NotificationDetailModel(
      detail: json['detail'] == null
          ? null
          : NotificationModel.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationDetailModelToJson(
        NotificationDetailModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };
