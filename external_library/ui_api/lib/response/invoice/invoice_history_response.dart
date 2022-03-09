import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/invoice/invoice_list_model.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/news/news_list_model.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'invoice_history_response.g.dart';

@JsonSerializable()
class InvoiceHistoryResponse extends BaseResponse {
  @JsonKey(name: 'data')
  InvoiceHistoryListModel? data;

  InvoiceHistoryResponse({this.data});

  factory InvoiceHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceHistoryResponseToJson(this);
}
