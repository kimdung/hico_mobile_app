// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierRequest _$SupplierRequestFromJson(Map<String, dynamic> json) =>
    SupplierRequest(
      serviceId: json['service_id'] as int?,
      filterDate: json['filter_date'] as String?,
      filterTimeSlot: json['filter_time_slot'] as String?,
      filterIsOnline: json['filter_is_online'] as int?,
      filterLocationProvinceId: json['filter_location_province_id'] as int?,
      filterLocationDistrictId: json['filter_location_district_id'] as int?,
      filterLevelId: json['filter_level_id'] as int?,
      filterNumberStar: json['filter_number_star'] as int?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$SupplierRequestToJson(SupplierRequest instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'filter_date': instance.filterDate,
      'filter_time_slot': instance.filterTimeSlot,
      'filter_is_online': instance.filterIsOnline,
      'filter_location_province_id': instance.filterLocationProvinceId,
      'filter_location_district_id': instance.filterLocationDistrictId,
      'filter_level_id': instance.filterLevelId,
      'filter_number_star': instance.filterNumberStar,
      'limit': instance.limit,
      'offset': instance.offset,
    };
