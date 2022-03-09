import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/service_category_model.dart';
part 'services_model.g.dart';

@JsonSerializable()
class ServiceModel {
  int? id;
  String? code;
  String? name;
  @JsonKey(name: 'display_image', defaultValue: '')
  String? displayImage;
  @JsonKey(name: 'category_name', defaultValue: '')
  String? categoryName;
  @JsonKey(name: 'service_category')
  ServiceCategoryModel? serviceCategory;
  String? description;
  int? price;

  ServiceModel(
      {this.id,
      this.code,
      this.name,
      this.displayImage,
      this.categoryName,
      this.serviceCategory,
      this.description,
      this.price});

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
