import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/user/documents_certificate_model.dart';

import '../user/services_model.dart';
import '../user/user_time_model.dart';
import '../user/workplaces_model.dart';
part 'supplier_profile_model.g.dart';

@JsonSerializable()
class SupplierProfileModel {
  int? id;
  String? name;
  @JsonKey(name: 'avatar_image', defaultValue: '')
  String? avatarImage;
  @JsonKey(name: 'avg_rating', defaultValue: '')
  String? avgRating;
  @JsonKey(name: 'task_complete_number')
  int? taskCompleteNumber;
  @JsonKey(name: 'total_customer')
  int? totalCustomer;
  String? education;
  String? experience;
  List<DocumentsCertificateModel>? files;
  @JsonKey(name: 'interpretation_experience_detail')
  String? interExpDetail;
  @JsonKey(name: 'interpretation_experience')
  int? interExp;
  @JsonKey(name: 'translation_experience_detail')
  String? transExpDetail;
  @JsonKey(name: 'translation_experience')
  int? transExp;
  List<UserServicesCategoryModel>? customServices;
  List<WorkplacesModel>? customWorkplaces;
  @JsonKey(name: 'user_time')
  List<UserTimeModel>? userTime;

  SupplierProfileModel({
    this.id,
    this.name,
    this.avatarImage,
    this.avgRating,
    this.taskCompleteNumber,
    this.totalCustomer,
    this.education,
    this.experience,
    this.files,
    this.interExpDetail,
    this.interExp,
    this.transExpDetail,
    this.transExp,
    this.customServices,
    this.customWorkplaces,
    this.userTime,
  });

  factory SupplierProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierProfileModelToJson(this);
}
