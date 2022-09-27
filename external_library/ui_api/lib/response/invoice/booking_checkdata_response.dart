import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/models/invoice/invoice_detail_model.dart';

import '../../models/supplier/supplier_info_model.dart';

part 'booking_checkdata_response.g.dart';

@JsonSerializable()
class BookingCheckDataResponse extends BaseResponse {
  @JsonKey(name: 'data')
  SupplierInfoModel? data;

  BookingCheckDataResponse({this.data});

  factory BookingCheckDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingCheckDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingCheckDataResponseToJson(this);
}
