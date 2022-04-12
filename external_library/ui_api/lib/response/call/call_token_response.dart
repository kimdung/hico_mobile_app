import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/call/call_token_model.dart';

part 'call_token_response.g.dart';

@JsonSerializable()
class CallTokenResponse extends BaseResponse {
  @JsonKey(name: 'data')
  CallTokenModel? data;

  CallTokenResponse({this.data});

  factory CallTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CallTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CallTokenResponseToJson(this);
}
 