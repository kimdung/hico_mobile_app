// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_checkdata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingCheckDataResponse _$BookingCheckDataResponseFromJson(
        Map<String, dynamic> json) =>
    BookingCheckDataResponse(
      data: json['data'] == null
          ? null
          : SupplierInfoModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$BookingCheckDataResponseToJson(
        BookingCheckDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
