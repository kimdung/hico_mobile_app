// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_voucher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVoucherResponse _$CheckVoucherResponseFromJson(
        Map<String, dynamic> json) =>
    CheckVoucherResponse(
      data: json['data'] == null
          ? null
          : CheckVoucherModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$CheckVoucherResponseToJson(
        CheckVoucherResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
