import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/wallet/topup_history_model.dart';

part 'topup_response.g.dart';

@JsonSerializable()
class TopupResponse extends BaseResponse {
  @JsonKey(name: 'data')
  TopupHistoryData? data;

  TopupResponse({this.data});

  factory TopupResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopupResponseToJson(this);
}
