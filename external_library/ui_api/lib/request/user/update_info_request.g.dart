// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInfoRequest _$UpdateInfoRequestFromJson(Map<String, dynamic> json) =>
    UpdateInfoRequest(
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      dateOfBirth: json['date_of_birth'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      bankBranchName: json['bank_branch_name'] as String? ?? '',
      bankAccountHolder: json['bank_account_holder'] as String? ?? '',
      bankAccountNumber: json['bank_account_number'] as String? ?? '',
    );

Map<String, dynamic> _$UpdateInfoRequestToJson(UpdateInfoRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'phone_number': instance.phoneNumber,
      'bank_name': instance.bankName,
      'bank_branch_name': instance.bankBranchName,
      'bank_account_holder': instance.bankAccountHolder,
      'bank_account_number': instance.bankAccountNumber,
    };
