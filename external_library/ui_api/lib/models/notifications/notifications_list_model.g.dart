// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsListModel _$NotificationsListModelFromJson(
        Map<String, dynamic> json) =>
    NotificationsListModel(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsListModelToJson(
        NotificationsListModel instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
