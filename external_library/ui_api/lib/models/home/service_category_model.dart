import 'package:json_annotation/json_annotation.dart';
part 'service_category_model.g.dart';

@JsonSerializable()
class ServiceCategoryModel {
  int? id;
  String? code;
  String? name;
  @JsonKey(name: 'display_image', defaultValue: '')
  String? displayImage;

  ServiceCategoryModel({this.id, this.code, this.name, this.displayImage});

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryModelToJson(this);
}
