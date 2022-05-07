// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UIItem _$UIItemFromJson(Map<String, dynamic> json) => UIItem(
      idItem: json['idItem'] as int,
      icon: json['icon'] as String?,
      behaviors: json['behaviors'] == null
          ? null
          : Behaviors.fromJson(json['behaviors'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UIItemToJson(UIItem instance) => <String, dynamic>{
      'idItem': instance.idItem,
      'icon': instance.icon,
      'behaviors': instance.behaviors,
      'name': instance.name,
    };

Behaviors _$BehaviorsFromJson(Map<String, dynamic> json) => Behaviors(
      action: json['action'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$BehaviorsToJson(Behaviors instance) => <String, dynamic>{
      'action': instance.action,
      'data': instance.data,
    };

WidgetType _$WidgetTypeFromJson(Map<String, dynamic> json) => WidgetType(
      items: UIItem.fromJson(json['items'] as Map<String, dynamic>),
      idTtile: json['idTtile'] as int,
    );

Map<String, dynamic> _$WidgetTypeToJson(WidgetType instance) =>
    <String, dynamic>{
      'items': instance.items,
      'idTtile': instance.idTtile,
    };
