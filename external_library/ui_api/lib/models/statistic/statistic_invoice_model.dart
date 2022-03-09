import 'package:json_annotation/json_annotation.dart';
part 'statistic_invoice_model.g.dart';

@JsonSerializable()
class StatisticInvoiceModel {
  int? id;
  String? code;
  @JsonKey(name: 'supplier_avatar', defaultValue: '')
  String? supplierAvatar;
  double? total;

  StatisticInvoiceModel({this.id, this.code, this.supplierAvatar, this.total});

  factory StatisticInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticInvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticInvoiceModelToJson(this);
}
