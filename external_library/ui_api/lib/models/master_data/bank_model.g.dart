// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankLocalModel _$BankLocalModelFromJson(Map<String, dynamic> json) =>
    BankLocalModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BankLocalModelToJson(BankLocalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
