import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/wallet/topup_history_model.dart';

part 'topup_komaju_response.g.dart';

@JsonSerializable()
class TopupKomajuResponse extends BaseResponse {
  @JsonKey(name: 'data')
  String? data;

  TopupKomajuResponse({this.data});

  factory TopupKomajuResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupKomajuResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TopupKomajuResponseToJson(this);
}
