// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticModel _$StatisticModelFromJson(Map<String, dynamic> json) =>
    StatisticModel(
      total: (json['total'] as num?)?.toDouble(),
      paid: (json['paid'] as num?)?.toDouble(),
      remain: (json['remain'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StatisticModelToJson(StatisticModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'paid': instance.paid,
      'remain': instance.remain,
    };
