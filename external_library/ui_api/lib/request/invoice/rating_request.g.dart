// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingRequest _$RatingRequestFromJson(Map<String, dynamic> json) =>
    RatingRequest(
      json['invoice_id'] as int?,
      json['number_star'] as int?,
      json['content'] as String,
    );

Map<String, dynamic> _$RatingRequestToJson(RatingRequest instance) =>
    <String, dynamic>{
      'invoice_id': instance.invoiceId,
      'number_star': instance.numberStar,
      'content': instance.content,
    };
