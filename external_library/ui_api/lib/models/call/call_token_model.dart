import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'call_token_model.g.dart';

@JsonSerializable()
class CallTokenModel {
  String? token;

  CallTokenModel({this.token});

  factory CallTokenModel.fromJson(Map<String, dynamic> json) =>
      _$CallTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallTokenModelToJson(this);
}
