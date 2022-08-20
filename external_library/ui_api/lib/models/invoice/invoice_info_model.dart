import 'package:collection/collection.dart';
import 'package:hico/data/app_data_global.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/invoice/cancel_reason_model.dart';
import 'package:ui_api/models/invoice/expand_period_model.dart';

import 'invoice_status.dart';

part 'invoice_info_model.g.dart';

@JsonSerializable()
class InvoiceInfoModel {
  int? id;
  String? code;
  @JsonKey(name: 'supplier_id')
  int? supplierId;
  @JsonKey(name: 'supplier_avatar', defaultValue: '')
  String? supplierAvatar;
  @JsonKey(name: 'supplier_name', defaultValue: '')
  String? supplierName;
  @JsonKey(name: 'working_form')
  int? workingForm;
  int? status;
  ServiceModel? service;
  @JsonKey(name: 'working_date', defaultValue: '')
  String? workingDate;
  @JsonKey(name: 'working_time', defaultValue: '')
  String? workingTime;
  @JsonKey(name: 'extra_time', defaultValue: '')
  String? extraTime;
  double? hours;
  @JsonKey(name: 'payment_type')
  int? paymentType;
  @JsonKey(name: 'traveling_costs')
  double? travelingCosts;
  @JsonKey(name: 'tmp_total')
  double? tmpTotal;
  double? voucher;
  @JsonKey(name: 'expand_period')
  List<ExpandPeriodModel>? expandPeriod;
  double? total;
  CancelReasonModel? cancel;
  @JsonKey(name: 'created_at', defaultValue: '')
  String? createdAt;
  @JsonKey(name: 'is_fined')
  int? isFined;
  @JsonKey(name: 'is_comment')
  int? isComment;
  @JsonKey(name: 'supplier_start', defaultValue: '')
  String? supplierStart;

  InvoiceInfoModel({
    this.id,
    this.code,
    this.supplierId,
    this.supplierAvatar,
    this.supplierName,
    this.workingForm,
    this.status,
    this.service,
    this.workingDate,
    this.workingTime,
    this.hours,
    this.paymentType,
    this.travelingCosts,
    this.tmpTotal,
    this.voucher,
    this.expandPeriod,
    this.total,
    this.cancel,
    this.createdAt,
    this.isFined,
    this.isComment,
    this.supplierStart,
  });

  factory InvoiceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceInfoModelToJson(this);

  InvoiceStatus? getStatus() {
    return InvoiceStatus.status
        .firstWhereOrNull((element) => element.id == status);
  }

  String getChatChannel() {
    return '$supplierId-${AppDataGlobal.userInfo?.id}';
  }

  String getCallChannel() {
    return '$supplierId-${AppDataGlobal.userInfo?.id}';
  }

  User getProvider() {
    return User(
      id: supplierId.toString(),
      name: supplierName,
      image: supplierAvatar,
    );
  }

  bool isNotCall() {
    return supplierStart?.isEmpty ?? true;
  }
}
