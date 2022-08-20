import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'topup_history_model.g.dart';

@JsonSerializable()
class TopupHistoryModel {
  static const int WAITTING = 0;
  static const int CONFIRMED = 1;
  static const int FAILURE = 2;

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

  String getMethod() {
    switch (type) {
      case 1: //Bank
        return 'topup.bank'.tr;
      case 2: // Online
        return 'booking.payment_online'.tr;
      case 3: // Stripe
        return 'topup.stripe'.tr;
      case 4: // Komaju
        return 'topup.komoju'.tr;
      case 5: // Refund
        return 'Refund';
      default:
        return '';
    }
  }

  String getStatus() {
    switch (status) {
      case WAITTING:
        return 'topup.waitting'.tr;
      case CONFIRMED:
        return 'topup.confirmed'.tr;
      case FAILURE:
        return 'topup.failed'.tr;
      default:
        return '';
    }
  }
}

@JsonSerializable()
class TopupHistoryData {
  @JsonKey(name: 'requires_action')
  bool? requiresAction;
  TopupHistoryModel? row;

  TopupHistoryData({this.requiresAction, this.row});

  factory TopupHistoryData.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$TopupHistoryDataToJson(this);
}
