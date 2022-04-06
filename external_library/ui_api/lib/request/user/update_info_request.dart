import 'package:json_annotation/json_annotation.dart';

part 'update_info_request.g.dart';

@JsonSerializable()
class UpdateInfoRequest {
  final String? name;
  final int? gender;
  @JsonKey(name: 'date_of_birth', defaultValue: '')
  final String? dateOfBirth;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String? phoneNumber;
  @JsonKey(name: 'bank_id')
  final int? bankId;
  @JsonKey(name: 'bank_branch_name', defaultValue: '')
  final String? bankBranchName;
  @JsonKey(name: 'bank_account_holder', defaultValue: '')
  final String? bankAccountHolder;
  @JsonKey(name: 'bank_account_number', defaultValue: '')
  final String? bankAccountNumber;
  @JsonKey(name: 'address_id')
  final int? addressId;
  final String? address;

  UpdateInfoRequest(
      {this.name,
      this.gender,
      this.dateOfBirth,
      this.phoneNumber,
      this.bankId,
      this.bankBranchName,
      this.bankAccountHolder,
      this.bankAccountNumber,
      this.addressId,
      this.address});

  factory UpdateInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInfoRequestToJson(this);
}
