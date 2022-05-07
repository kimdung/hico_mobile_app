import 'package:ui_api/models/ui_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_screen_ui_model.g.dart';

@JsonSerializable()
class ProfileUIModel {
  ProfileUIModel({
    required this.screenId,
    required this.accountScreen,
  });

  final String screenId;
  final AccountScreen accountScreen;

  factory ProfileUIModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUIModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileUIModelToJson(this);
}

@JsonSerializable()
class AccountScreen {
  AccountScreen({
    required this.profile,
  });

  final ProfileUI profile;

  factory AccountScreen.fromJson(Map<String, dynamic> json) =>
      _$AccountScreenFromJson(json);
  Map<String, dynamic> toJson() => _$AccountScreenToJson(this);
}

@JsonSerializable()
class ProfileUI {
  ProfileUI({
    required this.items,
    required this.idTtile,
    required this.titleName,
  });

  final List<UIItem> items;
  final int idTtile;
  final String titleName;

  factory ProfileUI.fromJson(Map<String, dynamic> json) =>
      _$ProfileUIFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileUIToJson(this);
}
