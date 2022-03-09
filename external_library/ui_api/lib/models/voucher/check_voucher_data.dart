import 'package:json_annotation/json_annotation.dart';

part 'check_voucher_data.g.dart';

@JsonSerializable()
class CheckVoucherModel {
  int? discount;
  @JsonKey(name: 'voucher_id', defaultValue: 0)
  int? voucherId;

  CheckVoucherModel({this.discount, this.voucherId});

  factory CheckVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$CheckVoucherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckVoucherModelToJson(this);
}
