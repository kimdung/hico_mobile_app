import 'package:json_annotation/json_annotation.dart';
part 'bank_model.g.dart';

@JsonSerializable()
class BankLocalModel {
  int? id;
  String? code;
  String? name;

  BankLocalModel({this.id, this.code, this.name});

  factory BankLocalModel.fromJson(Map<String, dynamic> json) =>
      _$BankLocalModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankLocalModelToJson(this);
}
