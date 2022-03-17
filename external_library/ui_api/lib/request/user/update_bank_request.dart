import 'package:json_annotation/json_annotation.dart';

part 'update_bank_request.g.dart';

@JsonSerializable()
class UpdateBankRequest {
  @JsonKey(name: 'bank_id')
  final int? bankId;
  @JsonKey(name: 'bank_branch_name', defaultValue: '')
  final String? bankBranchName;
  @JsonKey(name: 'bank_account_holder', defaultValue: '')
  final String? bankAccountHolder;
  @JsonKey(name: 'bank_account_number', defaultValue: '')
  final String? bankAccountNumber;

  UpdateBankRequest({
    this.bankId,
    this.bankBranchName,
    this.bankAccountHolder,
    this.bankAccountNumber,
  });

  factory UpdateBankRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBankRequestToJson(this);
}
