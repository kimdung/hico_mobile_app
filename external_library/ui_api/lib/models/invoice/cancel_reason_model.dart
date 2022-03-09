import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
part 'cancel_reason_model.g.dart';

@JsonSerializable()
class CancelReasonModel {
  @JsonKey(name: 'cancel_party')
  int? cancelParty;
  String? reason;
  @JsonKey(name: 'date_time', defaultValue: '')
  String? dateTime;

  CancelReasonModel({
    this.cancelParty,
    this.reason,
    this.dateTime,
  });
  factory CancelReasonModel.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReasonModelToJson(this);
}
