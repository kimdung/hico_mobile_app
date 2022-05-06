// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceHistoryListModel _$InvoiceHistoryListModelFromJson(
        Map<String, dynamic> json) =>
    InvoiceHistoryListModel(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => InvoiceHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceHistoryListModelToJson(
        InvoiceHistoryListModel instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };

InvoiceHistoryModel _$InvoiceHistoryModelFromJson(Map<String, dynamic> json) =>
    InvoiceHistoryModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      supplierId: json['supplier_id'] as int?,
      supplierAvatar: json['supplier_avatar'] as String? ?? '',
      supplierName: json['supplier_name'] as String? ?? '',
      taskCompleteNumber: json['task_complete_number'] as int?,
      serviceId: json['service_id'] as int?,
      serviceName: json['service_name'] as String? ?? '',
      price: json['price'] as int?,
      workingDate: json['working_date'] as String? ?? '',
      workingTime: json['working_time'] as String? ?? '',
      minHours: json['min_hours'] as int? ?? 0,
      offlinePriceMin: json['offline_price_min'] as int? ?? 0,
      status: json['status'] as int?,
      workingForm: json['working_form'] as int?,
    );

Map<String, dynamic> _$InvoiceHistoryModelToJson(
        InvoiceHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'supplier_id': instance.supplierId,
      'supplier_avatar': instance.supplierAvatar,
      'supplier_name': instance.supplierName,
      'task_complete_number': instance.taskCompleteNumber,
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'price': instance.price,
      'working_date': instance.workingDate,
      'working_time': instance.workingTime,
      'min_hours': instance.minHours,
      'offline_price_min': instance.offlinePriceMin,
      'status': instance.status,
      'working_form': instance.workingForm,
    };
