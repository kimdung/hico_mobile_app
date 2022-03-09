import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/ui_item.dart';

part 'home_screen_ui_model.g.dart';

@JsonSerializable()
class HomeScreenUiModel {
  HomeScreenUiModel({
    required this.screenId,
    required this.homeScreen,
  });

  String? screenId;
  HomeScreenModel homeScreen;

  factory HomeScreenUiModel.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenUiModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeScreenUiModelToJson(this);
}

@JsonSerializable()
class HomeScreenModel {
  HomeScreenModel({
    required this.topFeature,
    required this.specialService,
    required this.banner,
    required this.functions,
    required this.partner,
    required this.widgetType,
  });

  TopFeature topFeature;
  Banner specialService;
  Banner banner;
  HomeFunctions functions;
  HomeFunctions partner;
  WidgetType widgetType;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeScreenModelToJson(this);
}

@JsonSerializable()
class Banner {
  Banner({
    required this.items,
    required this.idTtile,
  });

  List<UIItem> items;
  int idTtile;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class HomeFunctions {
  HomeFunctions({
    required this.items,
    required this.idTtile,
    required this.titleName,
  });

  List<UIItem> items;
  int idTtile;
  String titleName;

  factory HomeFunctions.fromJson(Map<String, dynamic> json) =>
      _$HomeFunctionsFromJson(json);
  Map<String, dynamic> toJson() => _$HomeFunctionsToJson(this);
}

@JsonSerializable()
class TopFeature {
  TopFeature({
    required this.heartItem,
    required this.items,
    required this.idTtile,
  });

  UIItem heartItem;
  List<UIItem> items;
  int idTtile;

  factory TopFeature.fromJson(Map<String, dynamic> json) =>
      _$TopFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$TopFeatureToJson(this);
}
