import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/districts_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'district_response.g.dart';

@JsonSerializable()
class DistrictResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<DistrictsModel>? districts;

  DistrictResponse(this.districts);

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);
}
