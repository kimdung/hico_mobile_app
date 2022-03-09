import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/notifications/notification_detail_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'notification_detail_response.g.dart';

@JsonSerializable()
class NotificationDetailResponse extends BaseResponse {
  @JsonKey(name: 'data')
  NotificationDetailModel? detail;

  NotificationDetailResponse({this.detail});

  factory NotificationDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDetailResponseToJson(this);
}
