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
  @JsonKey(name: 'data_review')
  InvoiceReviewModel? dataReview;

  InvoiceDetailModel({this.detail, this.isComment});

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDetailModelToJson(this);
}

@JsonSerializable()
class InvoiceReviewModel {
  @JsonKey(name: 'content', defaultValue: '')
  String? content;
  @JsonKey(name: 'number_star', defaultValue: 0)
  int? numberStar;
  @JsonKey(name: 'created_at', defaultValue: '')
  String? createdAt;

  InvoiceReviewModel({
    this.content,
    this.numberStar,
    this.createdAt,
  });

  factory InvoiceReviewModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceReviewModelToJson(this);
}
