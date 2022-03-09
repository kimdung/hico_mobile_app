import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/models/notifications/notification_model.dart';
part 'notifications_list_model.g.dart';

@JsonSerializable()
class NotificationsListModel {
  List<NotificationModel>? rows;

  NotificationsListModel({this.rows});

  factory NotificationsListModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsListModelToJson(this);
}
