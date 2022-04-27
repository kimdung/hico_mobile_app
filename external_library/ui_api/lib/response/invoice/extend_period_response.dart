import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/models/invoice/invoice_detail_model.dart';

import '../../models/invoice/extend_period_model.dart';

part 'extend_period_response.g.dart';

@JsonSerializable()
class ExtendPeriodResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ExtendPeriodModel>? data;

  ExtendPeriodResponse({this.data});

  factory ExtendPeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtendPeriodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendPeriodResponseToJson(this);
}
