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
