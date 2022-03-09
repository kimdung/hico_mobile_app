import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';
import 'package:ui_api/models/supplier/supplier_profile_model.dart';

part 'data_supplier_profile.g.dart';

@JsonSerializable()
class DataSupplierProfileModel {
  SupplierProfileModel? profile;

  DataSupplierProfileModel({this.profile});

  factory DataSupplierProfileModel.fromJson(Map<String, dynamic> json) =>
      _$DataSupplierProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataSupplierProfileModelToJson(this);
}
