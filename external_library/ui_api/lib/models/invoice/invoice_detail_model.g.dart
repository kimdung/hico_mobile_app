// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) =>
    InvoiceDetailModel(
      detail: json['detail'] == null
          ? null
          : InvoiceInfoModel.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoiceDetailModelToJson(InvoiceDetailModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };
