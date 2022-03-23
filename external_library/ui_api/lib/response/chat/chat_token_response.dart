import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/chat/conversation_info_model.dart';

part 'chat_token_response.g.dart';

@JsonSerializable()
class ChatTokenResponse extends BaseResponse {
  @JsonKey(name: 'data')
  ConversationInfoModel? data;

  ChatTokenResponse({this.data});

  factory ChatTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatTokenResponseToJson(this);
}
