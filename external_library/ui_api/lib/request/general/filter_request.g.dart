// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterRequest _$FilterRequestFromJson(Map<String, dynamic> json) =>
    FilterRequest(
      json['limit'] as int,
      json['offset'] as int,
    );

Map<String, dynamic> _$FilterRequestToJson(FilterRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
