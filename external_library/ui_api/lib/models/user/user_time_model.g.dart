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
      beginTime: json['beginTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$UserTimeListModelToJson(UserTimeListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'beginTime': instance.beginTime,
      'endTime': instance.endTime,
    };
