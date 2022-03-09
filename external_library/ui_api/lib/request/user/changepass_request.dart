import 'package:json_annotation/json_annotation.dart';

part 'changepass_request.g.dart';

@JsonSerializable()
class ChangePassRequest {
  @JsonKey(name: 'old_password', defaultValue: '')
  String oldPassword;
  @JsonKey(name: 'new_password', defaultValue: '')
  String newPassword;

  ChangePassRequest(this.oldPassword, this.newPassword);

  factory ChangePassRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePassRequestToJson(this);
}
