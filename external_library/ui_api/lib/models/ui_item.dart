import 'package:json_annotation/json_annotation.dart';

part 'ui_item.g.dart';

@JsonSerializable()
class UIItem {
  UIItem({
    required this.idItem,
    required this.icon,
    required this.behaviors,
    required this.name,
  });

  int idItem;
  String? icon;
  Behaviors? behaviors;
  String? name;

  factory UIItem.fromJson(Map<String, dynamic> json) =>
      _$UIItemFromJson(json);
  Map<String, dynamic> toJson() => _$UIItemToJson(this);
}

@JsonSerializable()
class Behaviors {
  Behaviors({
    required this.action,
    required this.data,
  });

  String action;
  String data;

  factory Behaviors.fromJson(Map<String, dynamic> json) =>
      _$BehaviorsFromJson(json);
  Map<String, dynamic> toJson() => _$BehaviorsToJson(this);
}


@JsonSerializable()
class WidgetType {
  WidgetType({
    required this.items,
    required this.idTtile,
  });

  UIItem items;
  int idTtile;

  factory WidgetType.fromJson(Map<String, dynamic> json) =>
      _$WidgetTypeFromJson(json);
  Map<String, dynamic> toJson() => _$WidgetTypeToJson(this);
}
