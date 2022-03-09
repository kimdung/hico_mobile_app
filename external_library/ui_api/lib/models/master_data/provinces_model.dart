import 'package:json_annotation/json_annotation.dart';
part 'provinces_model.g.dart';

@JsonSerializable()
class ProvincesModel {
  int? id;
  String? zipCode;
  String? name;
  int? status;

  ProvincesModel({this.id, this.zipCode, this.name, this.status});

  factory ProvincesModel.fromJson(Map<String, dynamic> json) =>
      _$ProvincesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProvincesModelToJson(this);
}
