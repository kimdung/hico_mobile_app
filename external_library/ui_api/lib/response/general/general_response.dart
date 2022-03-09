import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/districts_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'general_response.g.dart';

@JsonSerializable()
class GerenalResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Object? data;

  GerenalResponse(this.data);

  factory GerenalResponse.fromJson(Map<String, dynamic> json) =>
      _$GerenalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GerenalResponseToJson(this);
}
