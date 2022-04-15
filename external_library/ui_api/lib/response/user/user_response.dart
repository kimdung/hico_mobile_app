import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse {
  @JsonKey(name: 'data')
  DataModel? data;

  UserResponse(this.data);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class DataModel {
  UserInfoModel? info;

  DataModel({this.info});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
