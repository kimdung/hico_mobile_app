import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/invoice/invoice_detail_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'invoice_detail_response.g.dart';

@JsonSerializable()
class InvoiceDetailResponse extends BaseResponse {
  @JsonKey(name: 'data')
  InvoiceDetailModel? data;

  InvoiceDetailResponse({this.data});

  factory InvoiceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDetailResponseToJson(this);
}
