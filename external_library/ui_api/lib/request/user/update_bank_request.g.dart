// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBankRequest _$UpdateBankRequestFromJson(Map<String, dynamic> json) =>
    UpdateBankRequest(
      bankName: json['bank_name'] as String? ?? '',
      bankBranchName: json['bank_branch_name'] as String? ?? '',
      bankAccountHolder: json['bank_account_holder'] as String? ?? '',
      bankAccountNumber: json['bank_account_number'] as String? ?? '',
    );

Map<String, dynamic> _$UpdateBankRequestToJson(UpdateBankRequest instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'bank_branch_name': instance.bankBranchName,
      'bank_account_holder': instance.bankAccountHolder,
      'bank_account_number': instance.bankAccountNumber,
    };
