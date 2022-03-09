import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/voucher/check_voucher_data.dart';
import 'package:ui_api/response/base_response.dart';

part 'check_voucher_response.g.dart';

@JsonSerializable()
class CheckVoucherResponse extends BaseResponse {
  @JsonKey(name: 'data')
  CheckVoucherModel? data;

  CheckVoucherResponse({this.data});

  factory CheckVoucherResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckVoucherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckVoucherResponseToJson(this);
}
