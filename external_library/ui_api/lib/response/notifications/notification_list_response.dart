import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/news/news_list_model.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/models/notifications/notifications_list_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'notification_list_response.g.dart';

@JsonSerializable()
class NotificationListResponse extends BaseResponse {
  @JsonKey(name: 'data')
  NotificationsListModel? data;

  NotificationListResponse({this.data});

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListResponseToJson(this);
}
