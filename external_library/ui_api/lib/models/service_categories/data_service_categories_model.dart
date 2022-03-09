import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/service_category_model.dart';

part 'data_service_categories_model.g.dart';

@JsonSerializable()
class DataCategoriesServiceModel {
  List<ServiceCategoryModel>? serviceCategories;
  int? recordsTotal;

  DataCategoriesServiceModel({this.serviceCategories, this.recordsTotal});

  factory DataCategoriesServiceModel.fromJson(Map<String, dynamic> json) =>
      _$DataCategoriesServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoriesServiceModelToJson(this);
}
