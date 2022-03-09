import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/service_categories/data_service_categories_model.dart';
import 'package:ui_api/models/service_categories/data_service_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'service_list_response.g.dart';

@JsonSerializable()
class ServiceListResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DataServiceModel? dataService;

  ServiceListResponse({this.dataService});

  factory ServiceListResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceListResponseToJson(this);
}
