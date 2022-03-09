import 'package:json_annotation/json_annotation.dart';

part 'supplier_request.g.dart';

@JsonSerializable()
class SupplierRequest {
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'filter_date')
  String? filterDate;
  @JsonKey(name: 'filter_time_slot')
  String? filterTimeSlot;
  @JsonKey(name: 'filter_is_online')
  int? filterIsOnline;
  @JsonKey(name: 'filter_location_province_id')
  int? filterLocationProvinceId;
  @JsonKey(name: 'filter_location_district_id')
  int? filterLocationDistrictId;
  @JsonKey(name: 'filter_level_id')
  int? filterLevelId;
  @JsonKey(name: 'filter_number_star')
  int? filterNumberStar;
  int? limit;
  int? offset;

  SupplierRequest(
      {this.serviceId,
      this.filterDate,
      this.filterTimeSlot,
      this.filterIsOnline,
      this.filterLocationProvinceId,
      this.filterLocationDistrictId,
      this.filterLevelId,
      this.filterNumberStar,
      this.limit,
      this.offset});

  factory SupplierRequest.fromJson(Map<String, dynamic> json) =>
      _$SupplierRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierRequestToJson(this);
}
