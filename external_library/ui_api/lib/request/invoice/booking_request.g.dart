// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      supplierId: json['supplier_id'] as int?,
      serviceId: json['service_id'] as int?,
      workingForm: json['working_form'] as int?,
      workingDate: json['working_date'] as String?,
      workingTime: json['working_time'] as String?,
      paymentType: json['payment_type'] as int?,
      voucherId: json['voucher_id'] as int?,
      addressId: json['address_id'] as int?,
      address: json['address'] as String?,
      nearestStation: json['nearest_station'] as String?,
      hospitalName: json['hospital_name'] as String?,
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'supplier_id': instance.supplierId,
      'service_id': instance.serviceId,
      'working_form': instance.workingForm,
      'working_date': instance.workingDate,
      'working_time': instance.workingTime,
      'payment_type': instance.paymentType,
      'voucher_id': instance.voucherId,
      'address_id': instance.addressId,
      'address': instance.address,
      'nearest_station': instance.nearestStation,
      'hospital_name': instance.hospitalName,
    };
