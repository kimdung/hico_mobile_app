import 'package:json_annotation/json_annotation.dart';

part 'contact_request.g.dart';

@JsonSerializable()
class ContactRequest {
  final String name;
  final String email;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  final String content;

  ContactRequest(
    this.name,
    this.email,
    this.phoneNumber,
    this.content,
  );

  factory ContactRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ContactRequestToJson(this);
}
