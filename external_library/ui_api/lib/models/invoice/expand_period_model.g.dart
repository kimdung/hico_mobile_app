// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expand_period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpandPeriodModel _$ExpandPeriodModelFromJson(Map<String, dynamic> json) =>
    ExpandPeriodModel(
      times: json['times'] as int?,
      minutes: json['minutes'] as int?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExpandPeriodModelToJson(ExpandPeriodModel instance) =>
    <String, dynamic>{
      'times': instance.times,
      'minutes': instance.minutes,
      'price': instance.price,
    };
