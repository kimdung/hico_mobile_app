// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupHistoryModel _$TopupHistoryModelFromJson(Map<String, dynamic> json) =>
    TopupHistoryModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      type: json['type'] as int?,
      note: json['note'] as String?,
      status: json['status'] as int?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$TopupHistoryModelToJson(TopupHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'amount': instance.amount,
      'type': instance.type,
      'note': instance.note,
      'status': instance.status,
      'image': instance.image,
      'created_at': instance.createdAt,
    };

TopupHistoryData _$TopupHistoryDataFromJson(Map<String, dynamic> json) =>
    TopupHistoryData(
      requiresAction: json['requiresAction'] as bool?,
      row: json['requires_action'] == null
          ? null
          : TopupHistoryModel.fromJson(
              json['requires_action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopupHistoryDataToJson(TopupHistoryData instance) =>
    <String, dynamic>{
      'requiresAction': instance.requiresAction,
      'requires_action': instance.row,
    };
