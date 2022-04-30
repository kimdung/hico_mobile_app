import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/wallet/topup_histories_model.dart';

part 'topup_history_response.g.dart';

@JsonSerializable()
class TopupHistoryResponse extends BaseResponse {
  @JsonKey(name: 'data')
  TopupHistoriesModel? data;

  TopupHistoryResponse({this.data});

  factory TopupHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopupHistoryResponseToJson(this);
}
