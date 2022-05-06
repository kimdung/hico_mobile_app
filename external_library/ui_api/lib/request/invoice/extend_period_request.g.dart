// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_period_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendPeriodRequest _$ExtendPeriodRequestFromJson(Map<String, dynamic> json) =>
    ExtendPeriodRequest(
      invoiceId: json['invoice_id'] as int?,
      extendPeriodId: json['extend_period_id'] as int?,
      paymentType: json['payment_type'] as int?,
    );

Map<String, dynamic> _$ExtendPeriodRequestToJson(
        ExtendPeriodRequest instance) =>
    <String, dynamic>{
      'invoice_id': instance.invoiceId,
      'extend_period_id': instance.extendPeriodId,
      'payment_type': instance.paymentType,
    };

ExtendPrepareModel _$ExtendPrepareModelFromJson(Map<String, dynamic> json) =>
    ExtendPrepareModel(
      invoiceId: json['invoiceId'] as int?,
      extendPeriod: json['extendPeriod'] == null
          ? null
          : ExtendPeriodModel.fromJson(
              json['extendPeriod'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendPrepareModelToJson(ExtendPrepareModel instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'extendPeriod': instance.extendPeriod,
    };
