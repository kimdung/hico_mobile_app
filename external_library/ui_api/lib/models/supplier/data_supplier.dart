import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';

part 'data_supplier.g.dart';

@JsonSerializable()
class DataSupplierModel {
  ServiceModel? service;
  List<SupplierInfoModel>? suppliers;

  DataSupplierModel({this.service, this.suppliers});

  factory DataSupplierModel.fromJson(Map<String, dynamic> json) =>
      _$DataSupplierModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataSupplierModelToJson(this);
}

