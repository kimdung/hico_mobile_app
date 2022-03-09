import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/service_categories/data_service_categories_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'service_categories_response.g.dart';

@JsonSerializable()
class ServiceCategoriesResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DataCategoriesServiceModel? dataServiceCategories;

  ServiceCategoriesResponse({this.dataServiceCategories});

  factory ServiceCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoriesResponseToJson(this);
}
