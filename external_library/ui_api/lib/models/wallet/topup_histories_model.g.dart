// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_histories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupHistoriesModel _$TopupHistoriesModelFromJson(Map<String, dynamic> json) =>
    TopupHistoriesModel(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => TopupHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordsTotal: json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$TopupHistoriesModelToJson(
        TopupHistoriesModel instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'recordsTotal': instance.recordsTotal,
    };
