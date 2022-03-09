import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/voucher/voucher_model.dart';

part 'list_voucher_model.g.dart';

@JsonSerializable()
class ListVoucherModel {
  List<VoucherModel>? rows;

  ListVoucherModel({this.rows});

  factory ListVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$ListVoucherModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListVoucherModelToJson(this);
}
