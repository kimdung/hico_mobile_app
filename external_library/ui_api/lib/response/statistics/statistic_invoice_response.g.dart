// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticInvoiceResponse _$StatisticInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    StatisticInvoiceResponse(
      data: json['data'] == null
          ? null
          : StatisticsInvoiceList.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$StatisticInvoiceResponseToJson(
        StatisticInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };

StatisticsInvoiceList _$StatisticsInvoiceListFromJson(
        Map<String, dynamic> json) =>
    StatisticsInvoiceList(
      rows: (json['rows'] as List<dynamic>?)
          ?.map(
              (e) => StatisticInvoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$StatisticsInvoiceListToJson(
        StatisticsInvoiceList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'rows': instance.rows,
    };
