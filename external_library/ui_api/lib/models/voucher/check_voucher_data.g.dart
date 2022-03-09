// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_voucher_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVoucherModel _$CheckVoucherModelFromJson(Map<String, dynamic> json) =>
    CheckVoucherModel(
      discount: json['discount'] as int?,
      voucherId: json['voucher_id'] as int? ?? 0,
    );

Map<String, dynamic> _$CheckVoucherModelToJson(CheckVoucherModel instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'voucher_id': instance.voucherId,
    };
