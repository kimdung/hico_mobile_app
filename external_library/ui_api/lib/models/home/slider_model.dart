import 'package:json_annotation/json_annotation.dart';
part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  int? id;
  String? name;
  @JsonKey(name: 'display_image', defaultValue: '')
  String? displayImage;
  int? order;
  int? status;

  SliderModel({this.id, this.name, this.displayImage, this.order, this.status});

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
