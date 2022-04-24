import 'package:json_annotation/json_annotation.dart';
part 'topup_history_model.g.dart';

@JsonSerializable()
class TopupHistoryModel {
  static const int CONFIRMED = 1;

  int? id;
  String? code;
  double? amount;
  int? type;
  String? note;
  int? status;
  String? image;
  @JsonKey(name: 'created_at', defaultValue: '')
  String? createdAt;

  TopupHistoryModel({
    this.id,
    this.code,
    this.amount,
    this.type,
    this.note,
    this.status,
    this.image,
    this.createdAt,
  });

  factory TopupHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopupHistoryModelToJson(this);
}

@JsonSerializable()
class TopupHistoryData {
  TopupHistoryModel? row;

  TopupHistoryData({this.row});

  factory TopupHistoryData.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$TopupHistoryDataToJson(this);
}
