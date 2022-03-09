// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierProfileModel _$SupplierProfileModelFromJson(
        Map<String, dynamic> json) =>
    SupplierProfileModel(
      name: json['name'] as String?,
      avatarImage: json['avatar_image'] as String? ?? '',
      avgRating: json['avg_rating'] as String? ?? '',
      taskCompleteNumber: json['task_complete_number'] as int?,
      totalCustomer: json['total_customer'] as int?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) =>
              DocumentsCertificateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupplierProfileModelToJson(
        SupplierProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar_image': instance.avatarImage,
      'avg_rating': instance.avgRating,
      'task_complete_number': instance.taskCompleteNumber,
      'total_customer': instance.totalCustomer,
      'education': instance.education,
      'experience': instance.experience,
      'files': instance.files,
    };
