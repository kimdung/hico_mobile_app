import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/notifications/notification_model.dart';
part 'notification_detail_model.g.dart';

@JsonSerializable()
class NotificationDetailModel {
  NotificationModel? detail;

  NotificationDetailModel({this.detail});

  factory NotificationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDetailModelToJson(this);
}
