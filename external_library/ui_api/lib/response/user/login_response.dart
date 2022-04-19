import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/user/login_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: 'data')
  LoginModel? loginModel;

  LoginResponse(this.loginModel);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
