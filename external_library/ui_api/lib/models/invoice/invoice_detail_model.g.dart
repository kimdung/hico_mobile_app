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
      isComment: json['is_comment'] as int? ?? 0,
    );

Map<String, dynamic> _$InvoiceDetailModelToJson(InvoiceDetailModel instance) =>
    <String, dynamic>{
      'is_comment': instance.isComment,
      'detail': instance.detail,
    };
