// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVoucherModel _$ListVoucherModelFromJson(Map<String, dynamic> json) =>
    ListVoucherModel(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => VoucherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListVoucherModelToJson(ListVoucherModel instance) =>
    <String, dynamic>{
      'rows': instance.rows,
    };
