import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/statistic/statistic_invoice_model.dart';
import 'package:ui_api/models/statistic/statistic_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'statistic_invoice_response.g.dart';

@JsonSerializable()
class StatisticInvoiceResponse extends BaseResponse {
  @JsonKey(name: 'data')
  StatisticsInvoiceList? data;

  StatisticInvoiceResponse({this.data});

  factory StatisticInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticInvoiceResponseToJson(this);
}

@JsonSerializable()
class StatisticsInvoiceList extends BaseResponse {
  List<StatisticInvoiceModel>? rows;

  StatisticsInvoiceList({this.rows});

  factory StatisticsInvoiceList.fromJson(Map<String, dynamic> json) =>
      _$StatisticsInvoiceListFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsInvoiceListToJson(this);
}
