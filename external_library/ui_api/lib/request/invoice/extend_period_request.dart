import 'package:json_annotation/json_annotation.dart';

import '../../models/invoice/extend_period_model.dart';

part 'extend_period_request.g.dart';

@JsonSerializable()
class ExtendPeriodRequest {
  @JsonKey(name: 'invoice_id')
  int? invoiceId;
  @JsonKey(name: 'extend_period_id')
  int? extendPeriodId;
  @JsonKey(name: 'payment_type')
  int? paymentType;


  ExtendPeriodRequest({
    this.invoiceId,
    this.extendPeriodId,
    this.paymentType,
  });

  factory ExtendPeriodRequest.fromJson(Map<String, dynamic> json) =>
      _$ExtendPeriodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendPeriodRequestToJson(this);
}

@JsonSerializable()
class ExtendPrepareModel {
  int? invoiceId;
  ExtendPeriodModel? extendPeriod;

  ExtendPrepareModel({
    this.invoiceId,
    this.extendPeriod,
  });

  factory ExtendPrepareModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendPrepareModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendPrepareModelToJson(this);
}
