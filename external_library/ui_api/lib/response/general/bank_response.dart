import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/master_data/bank_model.dart';
import 'package:ui_api/models/master_data/districts_model.dart';
import 'package:ui_api/response/base_response.dart';

part 'bank_response.g.dart';

@JsonSerializable()
class BankResponse extends BaseResponse {
  @JsonKey(name: 'data')
  BankRowsModel? data;

  BankResponse(this.data);

  factory BankResponse.fromJson(Map<String, dynamic> json) =>
      _$BankResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankResponseToJson(this);
}

@JsonSerializable()
class BankRowsModel extends BaseResponse {
  @JsonKey(name: 'rows')
  List<BankLocalModel>? rows;

  BankRowsModel(this.rows);

  factory BankRowsModel.fromJson(Map<String, dynamic> json) =>
      _$BankRowsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankRowsModelToJson(this);
}
