import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/notifications/notification_detail_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'notification_unread_response.g.dart';

@JsonSerializable()
class NotificationUnreadResponse extends BaseResponse {
  @JsonKey(name: 'data')
  int? data;

  NotificationUnreadResponse({this.data});

  factory NotificationUnreadResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationUnreadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationUnreadResponseToJson(this);
}
