import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
part 'conversation_info_model.g.dart';

@JsonSerializable()
class ConversationInfoModel {
  String? id;
  String? name;
  String? image;
  @JsonKey(name: 'admin_id', defaultValue: '')
  String? adminId;
  String? token;

  ConversationInfoModel(
      {this.id, this.name, this.image, this.adminId, this.token});

  factory ConversationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationInfoModelToJson(this);

  String getAdminChannel() {
    return '$adminId-$id';
  }

  User getAdmin() {
    return User(id: adminId.toString(), name: 'Admin');
  }
}
