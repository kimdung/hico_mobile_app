import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/user/address_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse extends BaseResponse {
  @JsonKey(name: 'data')
  AddressList? data;

  AddressResponse(this.data);

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class AddressList extends BaseResponse {
  @JsonKey(name: 'rows')
  List<AddressModel>? rows;

  AddressList(this.rows);

  factory AddressList.fromJson(Map<String, dynamic> json) =>
      _$AddressListFromJson(json);

  Map<String, dynamic> toJson() => _$AddressListToJson(this);
}
