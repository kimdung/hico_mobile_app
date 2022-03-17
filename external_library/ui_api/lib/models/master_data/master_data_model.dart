import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'master_data_model.g.dart';

@JsonSerializable()
class MasterDataModel {
  @JsonKey(name: 'customer_allowed_hours')
  int? customerAllowedHours;
  @JsonKey(name: 'payment_policy', defaultValue: '')
  String? paymentPolicy;
  @JsonKey(name: 'privacy_policy', defaultValue: '')
  String? privacyPolicy;
  @JsonKey(name: 'supplier_allowed_hours')
  int? supplierAllowedHours;
  @JsonKey(name: 'terms_of_use', defaultValue: '')
  String? termsOfUse;
  @JsonKey(name: 'support_email', defaultValue: '')
  String? supportEmail;

  List<LevelModel>? levels;
  List<BankModel>? banks;
  List<ProvincesModel>? provinces;

  MasterDataModel(
      {this.customerAllowedHours,
      this.privacyPolicy,
      this.supplierAllowedHours,
      this.termsOfUse,
      this.levels,
      this.banks,
      this.provinces});

  factory MasterDataModel.fromJson(Map<String, dynamic> json) =>
      _$MasterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MasterDataModelToJson(this);
}

@JsonSerializable()
class LevelModel {
  int? id;
  int? level;
  String? name;
  @JsonKey(name: 'is_featured')
  int? isFeatured;

  LevelModel({this.id, this.level, this.name, this.isFeatured});

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      _$LevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelModelToJson(this);
}

@JsonSerializable()
class BankModel {
  int? id;
  String? name;
  @JsonKey(name: 'account_holder', defaultValue: '')
  String? accountHolder;
  @JsonKey(name: 'account_number', defaultValue: '')
  String? accountNumber;
  String? branch;

  BankModel(
      {this.id,
      this.name,
      this.accountHolder,
      this.accountNumber,
      this.branch});

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}
