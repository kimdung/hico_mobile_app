import 'package:json_annotation/json_annotation.dart';
part 'districts_model.g.dart';

@JsonSerializable()
class DistrictsModel {
  int? id;
  int? provinceId;
  String? code;
  String? name;
  int? status;

  DistrictsModel({this.id, this.provinceId, this.code, this.name, this.status});

  factory DistrictsModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictsModelToJson(this);
}
