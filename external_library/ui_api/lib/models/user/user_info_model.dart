import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/user/address_model.dart';
import 'package:ui_api/models/user/documents_certificate_model.dart';
import 'package:ui_api/models/user/services_model.dart';
import 'package:ui_api/models/user/user_time_model.dart';
import 'package:ui_api/models/user/workplaces_model.dart';

import '../chat/conversation_info_model.dart';
part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  int? id;
  @JsonKey(name: 'avatar_image', defaultValue: '')
  String? avatarImage;
  String? name;
  int? gender;
  @JsonKey(name: 'date_of_birth', defaultValue: '')
  String? dateOfBirth;
  String? email;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String? phoneNumber;
  @JsonKey(name: 'bank_id')
  int? bankId;
  @JsonKey(name: 'bank_name', defaultValue: '')
  String? bankName;
  @JsonKey(name: 'bank_branch_name', defaultValue: '')
  String? bankBranchName;
  @JsonKey(name: 'bank_account_holder', defaultValue: '')
  String? bankAccountHolder;
  @JsonKey(name: 'bank_account_number', defaultValue: '')
  String? bankAccountNumber;
  AddressModel? address;
  @JsonKey(name: 'nearest_station', defaultValue: '')
  String? nearestStation;
  @JsonKey(name: 'document_front_side', defaultValue: '')
  String? documentFrontSide;
  @JsonKey(name: 'document_back_side', defaultValue: '')
  String? documentBackSide;
  String? education;
  @JsonKey(name: 'documents_certificate')
  List<DocumentsCertificateModel>? documentsCertificate;
  String? level;
  String? experience;
  List<ServicesModel>? services;
  List<WorkplacesModel>? workplaces;
  @JsonKey(name: 'user_time')
  List<UserTimeModel>? userTime;
  @JsonKey(name: 'kyc_status')
  int? kycStatus;
  @JsonKey(name: 'conversation_info')
  ConversationInfoModel? conversationInfo;
  @JsonKey(name: 'account_balance')
  int? accountBalance;

  UserInfoModel(
      {this.id,
      this.avatarImage,
      this.name,
      this.gender,
      this.dateOfBirth,
      this.email,
      this.phoneNumber,
      this.bankName,
      this.bankBranchName,
      this.bankAccountHolder,
      this.bankAccountNumber,
      this.address,
      this.nearestStation,
      this.documentFrontSide,
      this.documentBackSide,
      this.education,
      this.documentsCertificate,
      this.level,
      this.experience,
      this.services,
      this.workplaces,
      this.userTime,
      this.kycStatus,
      this.conversationInfo});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  User getChatUser() {
    return User(
      id: id.toString(),
      name: name,
      image: avatarImage,
    );
  }
}
