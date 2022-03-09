// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailModel _$NewsDetailModelFromJson(Map<String, dynamic> json) =>
    NewsDetailModel(
      detail: json['detail'] == null
          ? null
          : NewsModel.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsDetailModelToJson(NewsDetailModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };
