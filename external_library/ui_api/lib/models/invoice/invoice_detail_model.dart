import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/invoice/invoice_info_model.dart';
part 'invoice_detail_model.g.dart';

@JsonSerializable()
class InvoiceDetailModel {
  @JsonKey(name: 'is_comment', defaultValue: 0)
  int? isComment;
  InvoiceInfoModel? detail;

  InvoiceDetailModel({this.detail, this.isComment});

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDetailModelToJson(this);
}
