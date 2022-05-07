import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/ui_item.dart';

part 'family_doctor_ui_model.g.dart';

@JsonSerializable()
class FamilyDoctorUiModel {
  FamilyDoctorUiModel({
    required this.screenId,
    required this.screenName,
    required this.onlineCounselingScreen,
  });

  final String screenId;
  final String screenName;
  final OnlineCounselingScreen onlineCounselingScreen;

  factory FamilyDoctorUiModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyDoctorUiModelFromJson(json);
  Map<String, dynamic> toJson() => _$FamilyDoctorUiModelToJson(this);
}

@JsonSerializable()
class OnlineCounselingScreen {
  OnlineCounselingScreen({
    required this.onlineCounseling,
    required this.widgetType,
  });

  final OnlineCounseling onlineCounseling;
  final WidgetType widgetType;

  factory OnlineCounselingScreen.fromJson(Map<String, dynamic> json) =>
      _$OnlineCounselingScreenFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineCounselingScreenToJson(this);
}

@JsonSerializable()
class OnlineCounseling {
  OnlineCounseling({
    required this.items,
    required this.idTtile,
  });

  final List<UIItem> items;
  final int idTtile;

  factory OnlineCounseling.fromJson(Map<String, dynamic> json) =>
      _$OnlineCounselingFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineCounselingToJson(this);
}
