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
  @JsonKey(name: 'url_link', defaultValue: '')
  String? urlLink;
  @JsonKey(name: 'item_id', defaultValue: 0)
  int? itemId;
  int? type;

  SliderModel({
    this.id,
    this.name,
    this.displayImage,
    this.order,
    this.status,
    this.urlLink,
    this.itemId,
    this.type,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
