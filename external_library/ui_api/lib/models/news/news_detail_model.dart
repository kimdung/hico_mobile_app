import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'news_detail_model.g.dart';

@JsonSerializable()
class NewsDetailModel {
  NewsModel? detail;

  NewsDetailModel({this.detail});

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailModelToJson(this);
}
