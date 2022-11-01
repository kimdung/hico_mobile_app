import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  int? id;
  String? title;
  String? description;
  @JsonKey(name: 'display_image', defaultValue: '')
  String? displayImage;
  @JsonKey(name: 'created_at', defaultValue: '')
  String? createdAt;
  @JsonKey(name: 'is_read')
  int? isRead;
  String? content;
  @JsonKey(name: 'display_type')
  int? displayType;
  @JsonKey(name: 'invoice_id')
  int? invoiceId;
  @JsonKey(name: 'type_link', defaultValue: '')
  String? typeLink;

  NotificationModel({
    this.id,
    this.title,
    this.description,
    this.displayImage,
    this.createdAt,
    this.isRead,
    this.content,
    this.displayType,
    this.invoiceId,
    this.typeLink,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
