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
      interExpDetail: json['interpretation_experience_detail'] as String?,
      interExp: json['interpretation_experience'] as int?,
      transExpDetail: json['translation_experience_detail'] as String?,
      transExp: json['translation_experience'] as int?,
      customServices: (json['customServices'] as List<dynamic>?)
          ?.map((e) =>
              UserServicesCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      customWorkplaces: (json['customWorkplaces'] as List<dynamic>?)
          ?.map((e) => WorkplacesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userTime: (json['user_time'] as List<dynamic>?)
          ?.map((e) => UserTimeModel.fromJson(e as Map<String, dynamic>))
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
      'interpretation_experience_detail': instance.interExpDetail,
      'interpretation_experience': instance.interExp,
      'translation_experience_detail': instance.transExpDetail,
      'translation_experience': instance.transExp,
      'customServices': instance.customServices,
      'customWorkplaces': instance.customWorkplaces,
      'user_time': instance.userTime,
    };
