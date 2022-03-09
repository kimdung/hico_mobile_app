// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_prepare_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingPrepareRequest _$BookingPrepareRequestFromJson(
        Map<String, dynamic> json) =>
    BookingPrepareRequest(
      supplier: json['supplier'] == null
          ? null
          : SupplierInfoModel.fromJson(
              json['supplier'] as Map<String, dynamic>),
      workingForm: json['workingForm'] as int?,
      service: json['service'] == null
          ? null
          : ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      totalTime: (json['totalTime'] as num?)?.toDouble(),
      supplierRequest: json['supplierRequest'] == null
          ? null
          : SupplierRequest.fromJson(
              json['supplierRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingPrepareRequestToJson(
        BookingPrepareRequest instance) =>
    <String, dynamic>{
      'supplier': instance.supplier,
      'workingForm': instance.workingForm,
      'service': instance.service,
      'totalTime': instance.totalTime,
      'supplierRequest': instance.supplierRequest,
    };
