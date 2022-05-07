// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenUiModel _$HomeScreenUiModelFromJson(Map<String, dynamic> json) =>
    HomeScreenUiModel(
      screenId: json['screenId'] as String?,
      homeScreen:
          HomeScreenModel.fromJson(json['homeScreen'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeScreenUiModelToJson(HomeScreenUiModel instance) =>
    <String, dynamic>{
      'screenId': instance.screenId,
      'homeScreen': instance.homeScreen,
    };

HomeScreenModel _$HomeScreenModelFromJson(Map<String, dynamic> json) =>
    HomeScreenModel(
      topFeature:
          TopFeature.fromJson(json['topFeature'] as Map<String, dynamic>),
      specialService:
          Banner.fromJson(json['specialService'] as Map<String, dynamic>),
      banner: Banner.fromJson(json['banner'] as Map<String, dynamic>),
      functions:
          HomeFunctions.fromJson(json['functions'] as Map<String, dynamic>),
      partner: HomeFunctions.fromJson(json['partner'] as Map<String, dynamic>),
      widgetType:
          WidgetType.fromJson(json['widgetType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeScreenModelToJson(HomeScreenModel instance) =>
    <String, dynamic>{
      'topFeature': instance.topFeature,
      'specialService': instance.specialService,
      'banner': instance.banner,
      'functions': instance.functions,
      'partner': instance.partner,
      'widgetType': instance.widgetType,
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      items: (json['items'] as List<dynamic>)
          .map((e) => UIItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTtile: json['idTtile'] as int,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'items': instance.items,
      'idTtile': instance.idTtile,
    };

HomeFunctions _$HomeFunctionsFromJson(Map<String, dynamic> json) =>
    HomeFunctions(
      items: (json['items'] as List<dynamic>)
          .map((e) => UIItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTtile: json['idTtile'] as int,
      titleName: json['titleName'] as String,
    );

Map<String, dynamic> _$HomeFunctionsToJson(HomeFunctions instance) =>
    <String, dynamic>{
      'items': instance.items,
      'idTtile': instance.idTtile,
      'titleName': instance.titleName,
    };

TopFeature _$TopFeatureFromJson(Map<String, dynamic> json) => TopFeature(
      heartItem: UIItem.fromJson(json['heartItem'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => UIItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTtile: json['idTtile'] as int,
    );

Map<String, dynamic> _$TopFeatureToJson(TopFeature instance) =>
    <String, dynamic>{
      'heartItem': instance.heartItem,
      'items': instance.items,
      'idTtile': instance.idTtile,
    };
