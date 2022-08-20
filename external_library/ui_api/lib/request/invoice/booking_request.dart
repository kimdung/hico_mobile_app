import 'package:json_annotation/json_annotation.dart';

part 'booking_request.g.dart';

@JsonSerializable()
class BookingRequest {
  @JsonKey(name: 'supplier_id')
  int? supplierId;
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'working_form')
  int? workingForm;
  @JsonKey(name: 'working_date')
  String? workingDate;
  @JsonKey(name: 'working_time')
  String? workingTime;
  @JsonKey(name: 'payment_type')
  int? paymentType;
  @JsonKey(name: 'voucher_id')
  int? voucherId;
  @JsonKey(name: 'address_id')
  int? addressId;
  String? address;
  @JsonKey(name: 'nearest_station')
  String? nearestStation;
   @JsonKey(name: 'hospital_name')
  String? hospitalName;

  BookingRequest({
    this.supplierId,
    this.serviceId,
    this.workingForm,
    this.workingDate,
    this.workingTime,
    this.paymentType,
    this.voucherId,
    this.addressId,
    this.address,
    this.nearestStation,
    this.hospitalName,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}
