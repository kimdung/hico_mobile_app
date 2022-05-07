// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_card_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipCardUIModel _$MembershipCardUIModelFromJson(
        Map<String, dynamic> json) =>
    MembershipCardUIModel(
      screenId: json['screenId'] as String,
      screenName: json['screenName'] as String,
      memberCardScreen: MemberCardScreen.fromJson(
          json['memberCardScreen'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MembershipCardUIModelToJson(
        MembershipCardUIModel instance) =>
    <String, dynamic>{
      'screenId': instance.screenId,
      'screenName': instance.screenName,
      'memberCardScreen': instance.memberCardScreen,
    };

MemberCardScreen _$MemberCardScreenFromJson(Map<String, dynamic> json) =>
    MemberCardScreen(
      serviceBenefits: ServiceBenefits.fromJson(
          json['serviceBenefits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemberCardScreenToJson(MemberCardScreen instance) =>
    <String, dynamic>{
      'serviceBenefits': instance.serviceBenefits,
    };

ServiceBenefits _$ServiceBenefitsFromJson(Map<String, dynamic> json) =>
    ServiceBenefits(
      items: (json['items'] as List<dynamic>)
          .map((e) => UIItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTtile: json['idTtile'] as int,
      titleName: json['titleName'] as String,
    );

Map<String, dynamic> _$ServiceBenefitsToJson(ServiceBenefits instance) =>
    <String, dynamic>{
      'items': instance.items,
      'idTtile': instance.idTtile,
      'titleName': instance.titleName,
    };
