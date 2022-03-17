// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankResponse _$BankResponseFromJson(Map<String, dynamic> json) => BankResponse(
      json['data'] == null
          ? null
          : BankRowsModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$BankResponseToJson(BankResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };

BankRowsModel _$BankRowsModelFromJson(Map<String, dynamic> json) =>
    BankRowsModel(
      (json['rows'] as List<dynamic>?)
          ?.map((e) => BankLocalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$BankRowsModelToJson(BankRowsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'rows': instance.rows,
    };
