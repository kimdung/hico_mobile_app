import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/service_category_model.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/home/slider_model.dart';
import 'package:ui_api/models/news/news_model.dart';
part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  @JsonKey(name: 'invoice_id', defaultValue: 0)
  int? invoiceId;
  @JsonKey(name: 'avatar_supplier', defaultValue: '')
  String? avatarSupplier;
  List<SliderModel>? sliders;
  List<ServiceCategoryModel>? serviceCategories;
  List<ServiceModel>? services;
  String? bannerHome;
  List<NewsModel>? news;
  List<ServiceModel>? serviceViews;

  HomeModel(
      {this.invoiceId,
      this.avatarSupplier,
      this.sliders,
      this.serviceCategories,
      this.services,
      this.bannerHome,
      this.news,
      this.serviceViews});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
