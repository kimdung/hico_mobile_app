import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/models/home/services_model.dart';

part 'data_service_model.g.dart';

@JsonSerializable()
class DataServiceModel {
  List<ServiceModel>? services;
  int? recordsTotal;

  DataServiceModel({this.services, this.recordsTotal});

  factory DataServiceModel.fromJson(Map<String, dynamic> json) =>
      _$DataServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataServiceModelToJson(this);
}
