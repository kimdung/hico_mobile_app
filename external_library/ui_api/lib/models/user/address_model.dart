import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  int? id;
  String? code;
  @JsonKey(name: 'province_name', defaultValue: '')
  String? provinceName;
  @JsonKey(name: 'district_name', defaultValue: '')
  String? districtName;
  String? address;
  @JsonKey(name: 'full_address', defaultValue: '')
  String? fullAddress;

  AddressModel(
      {this.id,
      this.code,
      this.provinceName,
      this.districtName,
      this.address,
      this.fullAddress});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
