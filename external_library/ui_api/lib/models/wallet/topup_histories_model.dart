import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/voucher/voucher_model.dart';

import 'topup_history_model.dart';

part 'topup_histories_model.g.dart';

@JsonSerializable()
class TopupHistoriesModel {
  List<TopupHistoryModel>? rows;
  int? recordsTotal;

  TopupHistoriesModel({this.rows, this.recordsTotal});

  factory TopupHistoriesModel.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopupHistoriesModelToJson(this);
}
