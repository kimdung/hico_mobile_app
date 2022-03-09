import 'package:json_annotation/json_annotation.dart';
part 'voucher_model.g.dart';

@JsonSerializable()
class VoucherModel {
  int? id;
  String? subtitle;
  String? code;
  String? name;
  @JsonKey(name: 'display_image', defaultValue: '')
  String? displayImage;
  String? condition;
  String? description;
  @JsonKey(name: 'start_time', defaultValue: '')
  String? startTime;
  @JsonKey(name: 'end_time', defaultValue: '')
  String? endTime;

  VoucherModel(
      {this.id,
      this.subtitle,
      this.code,
      this.name,
      this.displayImage,
      this.condition,
      this.description,
      this.startTime,
      this.endTime});

  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherModelToJson(this);
}
