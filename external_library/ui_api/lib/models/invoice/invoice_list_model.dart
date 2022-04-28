import 'package:hico/data/app_data_global.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:ui_api/models/master_data/provinces_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'invoice_list_model.g.dart';

@JsonSerializable()
class InvoiceHistoryListModel {
  List<InvoiceHistoryModel>? rows;

  InvoiceHistoryListModel({this.rows});

  factory InvoiceHistoryListModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceHistoryListModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceHistoryListModelToJson(this);
}

@JsonSerializable()
class InvoiceHistoryModel {
  int? id;
  String? code;
  @JsonKey(name: 'supplier_id')
  int? supplierId;
  @JsonKey(name: 'supplier_avatar', defaultValue: '')
  String? supplierAvatar;
  @JsonKey(name: 'supplier_name', defaultValue: '')
  String? supplierName;
  @JsonKey(name: 'task_complete_number')
  int? taskCompleteNumber;
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'service_name', defaultValue: '')
  String? serviceName;
  int? price;
  @JsonKey(name: 'working_date', defaultValue: '')
  String? workingDate;
  @JsonKey(name: 'working_time', defaultValue: '')
  String? workingTime;
  @JsonKey(name: 'min_hours', defaultValue: 0)
  int? minHours;
  @JsonKey(name: 'offline_price_min', defaultValue: 0)
  int? offlinePriceMin;
  int? status;

  InvoiceHistoryModel(
      {this.id,
      this.code,
      this.supplierId,
      this.supplierAvatar,
      this.supplierName,
      this.taskCompleteNumber,
      this.serviceId,
      this.serviceName,
      this.price,
      this.workingDate,
      this.workingTime,
      this.minHours,
      this.offlinePriceMin,
      this.status,
      });

  factory InvoiceHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceHistoryModelToJson(this);

  String getChatChannel() {
    return '$supplierId-${AppDataGlobal.userInfo?.id}';
  }

  String getCallChannel() {
    return '$supplierId-${AppDataGlobal.userInfo?.id}';
  }

  User getProvider() {
    return User(
      id: serviceId.toString(),
      name: serviceName,
      image: supplierAvatar,
    );
  }
}
