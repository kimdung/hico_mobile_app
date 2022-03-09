import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  int? id;
  String? title;
  String? description;
  @JsonKey(name: 'display_image', defaultValue: '')
  String? displayImage;
  @JsonKey(name: 'created_at', defaultValue: '')
  String? createdAt;
  String? content;

  NewsModel(
      {this.id,
      this.title,
      this.description,
      this.displayImage,
      this.createdAt,
      this.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
