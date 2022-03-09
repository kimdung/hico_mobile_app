import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/news/news_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'news_list_model.g.dart';

@JsonSerializable()
class NewsListModel {
  List<NewsModel>? rows;

  NewsListModel({this.rows});

  factory NewsListModel.fromJson(Map<String, dynamic> json) =>
      _$NewsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListModelToJson(this);
}
