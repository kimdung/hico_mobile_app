import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/news/news_detail_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'news_detail_response.g.dart';

@JsonSerializable()
class NewsDetailResponse extends BaseResponse {
  @JsonKey(name: 'data')
  NewsDetailModel? detail;

  NewsDetailResponse({this.detail});

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailResponseToJson(this);
}
