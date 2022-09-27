import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
part 'extend_period_model.g.dart';

@JsonSerializable()
class ExtendPeriodModel {
  int? id;
  int? minutes;
  int? price;
  int? status;
  String? createdAt;
  String? updatedAt;

  ExtendPeriodModel(
      {this.id,
      this.minutes,
      this.price,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory ExtendPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendPeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendPeriodModelToJson(this);
}
