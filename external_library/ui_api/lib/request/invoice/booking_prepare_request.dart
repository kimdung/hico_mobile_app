import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/supplier/supplier_info_model.dart';
import 'package:ui_api/request/supplier/supplier_request.dart';

part 'booking_prepare_request.g.dart';

@JsonSerializable()
class BookingPrepareRequest {
  SupplierInfoModel? supplier;
  int? workingForm;
  ServiceModel? service;
  double? totalTime;
  SupplierRequest? supplierRequest;

  BookingPrepareRequest({
    this.supplier,
    this.workingForm,
    this.service,
    this.totalTime,
    this.supplierRequest,
  });

  factory BookingPrepareRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingPrepareRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookingPrepareRequestToJson(this);
}
