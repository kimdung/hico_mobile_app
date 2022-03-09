import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/supplier/data_supplier_profile.dart';
import 'package:ui_api/response/base_response.dart';

part 'supplier_profile_response.g.dart';

@JsonSerializable()
class SupplierProfileResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DataSupplierProfileModel? data;

  SupplierProfileResponse({this.data});

  factory SupplierProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierProfileResponseToJson(this);
}
