// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: json['id'] as int?,
      avatarImage: json['avatar_image'] as String? ?? '',
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      dateOfBirth: json['date_of_birth'] as String? ?? '',
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      bankBranchName: json['bank_branch_name'] as String? ?? '',
      bankAccountHolder: json['bank_account_holder'] as String? ?? '',
      bankAccountNumber: json['bank_account_number'] as String? ?? '',
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      nearestStation: json['nearest_station'] as String? ?? '',
      documentFrontSide: json['document_front_side'] as String? ?? '',
      documentBackSide: json['document_back_side'] as String? ?? '',
      education: json['education'] as String?,
      documentsCertificate: (json['documents_certificate'] as List<dynamic>?)
          ?.map((e) =>
              DocumentsCertificateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      level: json['level'] as String?,
      experience: json['experience'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServicesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      workplaces: (json['workplaces'] as List<dynamic>?)
          ?.map((e) => WorkplacesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userTime: (json['user_time'] as List<dynamic>?)
          ?.map((e) => UserTimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      kycStatus: json['kyc_status'] as int?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar_image': instance.avatarImage,
      'name': instance.name,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'bank_name': instance.bankName,
      'bank_branch_name': instance.bankBranchName,
      'bank_account_holder': instance.bankAccountHolder,
      'bank_account_number': instance.bankAccountNumber,
      'address': instance.address,
      'nearest_station': instance.nearestStation,
      'document_front_side': instance.documentFrontSide,
      'document_back_side': instance.documentBackSide,
      'education': instance.education,
      'documents_certificate': instance.documentsCertificate,
      'level': instance.level,
      'experience': instance.experience,
      'services': instance.services,
      'workplaces': instance.workplaces,
      'user_time': instance.userTime,
      'kyc_status': instance.kycStatus,
    };
