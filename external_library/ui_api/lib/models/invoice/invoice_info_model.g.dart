// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceInfoModel _$InvoiceInfoModelFromJson(Map<String, dynamic> json) =>
    InvoiceInfoModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      supplierId: json['supplier_id'] as int?,
      supplierAvatar: json['supplier_avatar'] as String? ?? '',
      supplierName: json['supplier_name'] as String? ?? '',
      workingForm: json['working_form'] as int?,
      status: json['status'] as int?,
      service: json['service'] == null
          ? null
          : ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      workingDate: json['working_date'] as String? ?? '',
      workingTime: json['working_time'] as String? ?? '',
      hours: json['hours'] as int?,
      paymentType: json['payment_type'] as int?,
      travelingCosts: (json['traveling_costs'] as num?)?.toDouble(),
      tmpTotal: (json['tmp_total'] as num?)?.toDouble(),
      voucher: (json['voucher'] as num?)?.toDouble(),
      expandPeriod: (json['expand_period'] as List<dynamic>?)
          ?.map((e) => ExpandPeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble(),
      cancel: json['cancel'] == null
          ? null
          : CancelReasonModel.fromJson(json['cancel'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? '',
      isFined: json['is_fined'] as int?,
    );

Map<String, dynamic> _$InvoiceInfoModelToJson(InvoiceInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'supplier_id': instance.supplierId,
      'supplier_avatar': instance.supplierAvatar,
      'supplier_name': instance.supplierName,
      'working_form': instance.workingForm,
      'status': instance.status,
      'service': instance.service,
      'working_date': instance.workingDate,
      'working_time': instance.workingTime,
      'hours': instance.hours,
      'payment_type': instance.paymentType,
      'traveling_costs': instance.travelingCosts,
      'tmp_total': instance.tmpTotal,
      'voucher': instance.voucher,
      'expand_period': instance.expandPeriod,
      'total': instance.total,
      'cancel': instance.cancel,
      'created_at': instance.createdAt,
      'is_fined': instance.isFined,
    };
