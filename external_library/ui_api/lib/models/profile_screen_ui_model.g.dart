// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUIModel _$ProfileUIModelFromJson(Map<String, dynamic> json) =>
    ProfileUIModel(
      screenId: json['screenId'] as String,
      accountScreen:
          AccountScreen.fromJson(json['accountScreen'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileUIModelToJson(ProfileUIModel instance) =>
    <String, dynamic>{
      'screenId': instance.screenId,
      'accountScreen': instance.accountScreen,
    };

AccountScreen _$AccountScreenFromJson(Map<String, dynamic> json) =>
    AccountScreen(
      profile: ProfileUI.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountScreenToJson(AccountScreen instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

ProfileUI _$ProfileUIFromJson(Map<String, dynamic> json) => ProfileUI(
      items: (json['items'] as List<dynamic>)
          .map((e) => UIItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTtile: json['idTtile'] as int,
      titleName: json['titleName'] as String,
    );

Map<String, dynamic> _$ProfileUIToJson(ProfileUI instance) => <String, dynamic>{
      'items': instance.items,
      'idTtile': instance.idTtile,
      'titleName': instance.titleName,
    };
