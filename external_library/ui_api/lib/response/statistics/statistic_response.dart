import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/statistic/statistic_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'statistic_response.g.dart';

@JsonSerializable()
class StatisticsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  StatisticsData? data;

  StatisticsResponse({this.data});

  factory StatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsResponseToJson(this);
}

@JsonSerializable()
class StatisticsData extends BaseResponse {
  StatisticModel? canceled;
  StatisticModel? completed;

  StatisticsData({this.canceled, this.completed});

  factory StatisticsData.fromJson(Map<String, dynamic> json) =>
      _$StatisticsDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsDataToJson(this);
}
