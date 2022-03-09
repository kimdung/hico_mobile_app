import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
part 'expand_period_model.g.dart';

@JsonSerializable()
class ExpandPeriodModel {
  int? times;
  int? minutes;
  double? price;

  ExpandPeriodModel({
    this.times,
    this.minutes,
    this.price,
  });
  factory ExpandPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$ExpandPeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpandPeriodModelToJson(this);
}
