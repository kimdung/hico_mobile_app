import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'is_resend')
  int? isResend;
  UserInfoModel? info;

  LoginModel({this.accessToken, this.info});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
