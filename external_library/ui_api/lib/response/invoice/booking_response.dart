import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/models/invoice/invoice_detail_model.dart';

part 'booking_response.g.dart';

@JsonSerializable()
class BookingResponse extends BaseResponse {
  @JsonKey(name: 'data')
  BookingDetailModel? data;

  BookingResponse({this.data});

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}

@JsonSerializable()
class BookingDetailModel {
  InvoiceInfoModel? detail;

  BookingDetailModel({this.detail});

  factory BookingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDetailModelToJson(this);
}
