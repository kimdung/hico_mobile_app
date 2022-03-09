import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String? email;
  final String? password;
  @JsonKey(name: 'access_token', defaultValue: '')
  final String? accessToken;
  @JsonKey(name: 'device_identifier', defaultValue: '')
  final String? deviceIdentifier;

  LoginRequest(
      {this.email, this.password, this.accessToken, this.deviceIdentifier});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
