// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendPeriodModel _$ExtendPeriodModelFromJson(Map<String, dynamic> json) =>
    ExtendPeriodModel(
      id: json['id'] as int?,
      minutes: json['minutes'] as int?,
      price: json['price'] as int?,
      status: json['status'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ExtendPeriodModelToJson(ExtendPeriodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minutes': instance.minutes,
      'price': instance.price,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
