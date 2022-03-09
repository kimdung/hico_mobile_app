import 'dart:io';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avatar_request.g.dart';

@JsonSerializable()
class AvatarRequest {
  @JsonKey(name: 'avatar_image')
  MultipartFile avatarImage;

  AvatarRequest(this.avatarImage);

  factory AvatarRequest.fromJson(Map<String, dynamic> json) =>
      _$AvatarRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarRequestToJson(this);
}
