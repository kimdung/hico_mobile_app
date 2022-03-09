import 'package:json_annotation/json_annotation.dart';
part 'supplier_info_model.g.dart';

@JsonSerializable()
class SupplierInfoModel {
  int? id;
  @JsonKey(name: 'member_code', defaultValue: '')
  String? memberCode;
  @JsonKey(name: 'avatar_image', defaultValue: '')
  String? avatarImage;
  String? name;
  @JsonKey(name: 'task_complete_number')
  int? taskCompleteNumber;
  @JsonKey(name: 'service_id')
  int? serviceId;
  @JsonKey(name: 'service_name', defaultValue: '')
  String? serviceName;
  @JsonKey(name: 'service_price')
  int? servicePrice;

  SupplierInfoModel(
      {this.id,
      this.memberCode,
      this.avatarImage,
      this.name,
      this.taskCompleteNumber,
      this.serviceId,
      this.serviceName,
      this.servicePrice});

  factory SupplierInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierInfoModelToJson(this);
}
