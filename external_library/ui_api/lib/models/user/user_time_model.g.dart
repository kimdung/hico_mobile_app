// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTimeModel _$UserTimeModelFromJson(Map<String, dynamic> json) =>
    UserTimeModel(
      date: json['date'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => UserTimeListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserTimeModelToJson(UserTimeModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'list': instance.list,
    };

UserTimeListModel _$UserTimeListModelFromJson(Map<String, dynamic> json) =>
    UserTimeListModel(
      id: json['id'] as int?,
      date: json['date'] as String?,
      beginTime: json['begin_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
    );

Map<String, dynamic> _$UserTimeListModelToJson(UserTimeListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'begin_time': instance.beginTime,
      'end_time': instance.endTime,
    };
