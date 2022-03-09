import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/models/news/news_list_model.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse extends BaseResponse {
  @JsonKey(name: 'data')
  NewsListModel? newsListModel;

  NewsListResponse({this.newsListModel});

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListResponseToJson(this);
}
