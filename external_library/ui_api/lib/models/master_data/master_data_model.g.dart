// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterDataModel _$MasterDataModelFromJson(Map<String, dynamic> json) =>
    MasterDataModel(
      customerAllowedHours: json['customer_allowed_hours'] as int? ?? 0,
      customerAllowedHoursOffline:
          json['customer_allowed_hours_offline'] as int? ?? 0,
      customerAllowedHoursOnline:
          json['customer_allowed_hours_online'] as int? ?? 0,
      hotline: json['hotline'] as String?,
      linkMessenger: json['link_messenger'] as String? ?? '',
      paymentPolicy: json['payment_policy'] as String? ?? '',
      privacyPolicy: json['privacy_policy'] as String? ?? '',
      shippingFeeMin: json['shipping_fee_min'] as String? ?? '',
      supplierAllowedHours: json['supplier_allowed_hours'] as int? ?? 0,
      supplierAllowedHoursOffline:
          json['supplier_allowed_hours_offline'] as int? ?? 0,
      supplierAllowedHoursOnline:
          json['supplier_allowed_hours_online'] as int? ?? 0,
      supportEmail: json['support_email'] as String? ?? '',
      termsOfUse: json['terms_of_use'] as String? ?? '',
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) => LevelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      banks: (json['banks'] as List<dynamic>?)
          ?.map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      provinces: (json['provinces'] as List<dynamic>?)
          ?.map((e) => ProvincesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loginSocial: json['login_social'] as int? ?? 0,
    );

Map<String, dynamic> _$MasterDataModelToJson(MasterDataModel instance) =>
    <String, dynamic>{
      'customer_allowed_hours': instance.customerAllowedHours,
      'customer_allowed_hours_offline': instance.customerAllowedHoursOffline,
      'customer_allowed_hours_online': instance.customerAllowedHoursOnline,
      'hotline': instance.hotline,
      'link_messenger': instance.linkMessenger,
      'payment_policy': instance.paymentPolicy,
      'privacy_policy': instance.privacyPolicy,
      'shipping_fee_min': instance.shippingFeeMin,
      'supplier_allowed_hours': instance.supplierAllowedHours,
      'supplier_allowed_hours_offline': instance.supplierAllowedHoursOffline,
      'supplier_allowed_hours_online': instance.supplierAllowedHoursOnline,
      'support_email': instance.supportEmail,
      'terms_of_use': instance.termsOfUse,
      'levels': instance.levels,
      'banks': instance.banks,
      'provinces': instance.provinces,
      'login_social': instance.loginSocial,
    };

LevelModel _$LevelModelFromJson(Map<String, dynamic> json) => LevelModel(
      id: json['id'] as int?,
      level: json['level'] as int?,
      name: json['name'] as String?,
      isFeatured: json['is_featured'] as int?,
    );

Map<String, dynamic> _$LevelModelToJson(LevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'name': instance.name,
      'is_featured': instance.isFeatured,
    };

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      accountHolder: json['account_holder'] as String? ?? '',
      accountNumber: json['account_number'] as String? ?? '',
      branch: json['branch'] as String?,
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'account_holder': instance.accountHolder,
      'account_number': instance.accountNumber,
      'branch': instance.branch,
    };
