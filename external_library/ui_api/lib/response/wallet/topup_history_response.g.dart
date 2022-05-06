// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupHistoryResponse _$TopupHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    TopupHistoryResponse(
      data: json['data'] == null
          ? null
          : TopupHistoriesModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$TopupHistoryResponseToJson(
        TopupHistoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
