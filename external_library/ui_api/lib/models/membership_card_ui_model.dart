import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/ui_item.dart';

part 'membership_card_ui_model.g.dart';

@JsonSerializable()
class MembershipCardUIModel {
  MembershipCardUIModel({
    required this.screenId,
    required this.screenName,
    required this.memberCardScreen,
  });

  final String screenId;
  final String screenName;
  final MemberCardScreen memberCardScreen;

  factory MembershipCardUIModel.fromJson(Map<String, dynamic> json) =>
      _$MembershipCardUIModelFromJson(json);
  Map<String, dynamic> toJson() => _$MembershipCardUIModelToJson(this);
}

@JsonSerializable()
class MemberCardScreen {
  MemberCardScreen({
    required this.serviceBenefits,
  });

  final ServiceBenefits serviceBenefits;

  factory MemberCardScreen.fromJson(Map<String, dynamic> json) =>
      _$MemberCardScreenFromJson(json);
  Map<String, dynamic> toJson() => _$MemberCardScreenToJson(this);
}

@JsonSerializable()
class ServiceBenefits {
  ServiceBenefits({
    required this.items,
    required this.idTtile,
    required this.titleName,
  });

  final List<UIItem> items;
  final int idTtile;
  final String titleName;

  factory ServiceBenefits.fromJson(Map<String, dynamic> json) =>
      _$ServiceBenefitsFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceBenefitsToJson(this);
}
