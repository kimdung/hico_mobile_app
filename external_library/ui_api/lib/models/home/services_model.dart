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
  @JsonKey(name: 'min_hours')
  int? minHours;
  @JsonKey(name: 'offline_price_min')
  int? offlinePriceMin;
  double? hours;

  ServiceModel({
    this.id,
    this.code,
    this.name,
    this.displayImage,
    this.categoryName,
    this.serviceCategory,
    this.description,
    this.price,
    this.minHours,
    this.offlinePriceMin,
    this.hours,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
