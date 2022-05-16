import 'package:json_annotation/json_annotation.dart';
part 'statistic_model.g.dart';

@JsonSerializable()
class StatisticModel {
  double? balance;
  @JsonKey(name: 'refunds_by_supplier')
  double? refundsBySupplier;
  @JsonKey(name: 'amount_total')
  double? amountTotal;
  @JsonKey(name: 'fined_amount')
  double? finedAmount;

  StatisticModel(
      {this.balance,
      this.refundsBySupplier,
      this.amountTotal,
      this.finedAmount});

  factory StatisticModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticModelToJson(this);
}
