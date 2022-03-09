import 'package:json_annotation/json_annotation.dart';
part 'workplaces_model.g.dart';

@JsonSerializable()
class WorkplacesModel {
  int? provinceId;
  String? name;
  List<DistrictsModel>? districts;

  WorkplacesModel({this.provinceId, this.name, this.districts});

  factory WorkplacesModel.fromJson(Map<String, dynamic> json) =>
      _$WorkplacesModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkplacesModelToJson(this);
}

@JsonSerializable()
class DistrictsModel {
  int? id;
  String? name;

  DistrictsModel({this.id, this.name});

  factory DistrictsModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictsModelToJson(this);
}
