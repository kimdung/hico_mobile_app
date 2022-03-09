import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/supplier/data_supplier.dart';
import 'package:ui_api/response/base_response.dart';

part 'supplier_response.g.dart';

@JsonSerializable()
class SupplierResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DataSupplierModel? data;

  SupplierResponse({this.data});

  factory SupplierResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierResponseToJson(this);
}
