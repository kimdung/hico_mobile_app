// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_doctor_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyDoctorUiModel _$FamilyDoctorUiModelFromJson(Map<String, dynamic> json) =>
    FamilyDoctorUiModel(
      screenId: json['screenId'] as String,
      screenName: json['screenName'] as String,
      onlineCounselingScreen: OnlineCounselingScreen.fromJson(
          json['onlineCounselingScreen'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FamilyDoctorUiModelToJson(
        FamilyDoctorUiModel instance) =>
    <String, dynamic>{
      'screenId': instance.screenId,
      'screenName': instance.screenName,
      'onlineCounselingScreen': instance.onlineCounselingScreen,
    };

OnlineCounselingScreen _$OnlineCounselingScreenFromJson(
        Map<String, dynamic> json) =>
    OnlineCounselingScreen(
      onlineCounseling: OnlineCounseling.fromJson(
          json['onlineCounseling'] as Map<String, dynamic>),
      widgetType:
          WidgetType.fromJson(json['widgetType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnlineCounselingScreenToJson(
        OnlineCounselingScreen instance) =>
    <String, dynamic>{
      'onlineCounseling': instance.onlineCounseling,
      'widgetType': instance.widgetType,
    };

OnlineCounseling _$OnlineCounselingFromJson(Map<String, dynamic> json) =>
    OnlineCounseling(
      items: (json['items'] as List<dynamic>)
          .map((e) => UIItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTtile: json['idTtile'] as int,
    );

Map<String, dynamic> _$OnlineCounselingToJson(OnlineCounseling instance) =>
    <String, dynamic>{
      'items': instance.items,
      'idTtile': instance.idTtile,
    };
