// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelReasonModel _$CancelReasonModelFromJson(Map<String, dynamic> json) =>
    CancelReasonModel(
      cancelParty: json['cancel_party'] as int?,
      reason: json['reason'] as String?,
      dateTime: json['date_time'] as String? ?? '',
    );

Map<String, dynamic> _$CancelReasonModelToJson(CancelReasonModel instance) =>
    <String, dynamic>{
      'cancel_party': instance.cancelParty,
      'reason': instance.reason,
      'date_time': instance.dateTime,
    };
