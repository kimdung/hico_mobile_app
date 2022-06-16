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
    )..dataReview = json['data_review'] == null
        ? null
        : InvoiceReviewModel.fromJson(
            json['data_review'] as Map<String, dynamic>);

Map<String, dynamic> _$InvoiceDetailModelToJson(InvoiceDetailModel instance) =>
    <String, dynamic>{
      'is_comment': instance.isComment,
      'detail': instance.detail,
      'data_review': instance.dataReview,
    };

InvoiceReviewModel _$InvoiceReviewModelFromJson(Map<String, dynamic> json) =>
    InvoiceReviewModel(
      content: json['content'] as String? ?? '',
      numberStar: json['number_star'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$InvoiceReviewModelToJson(InvoiceReviewModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'number_star': instance.numberStar,
      'created_at': instance.createdAt,
    };
