import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/master_data/master_data_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  HomeModel? homeModel;

  HomeResponse({this.homeModel});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
