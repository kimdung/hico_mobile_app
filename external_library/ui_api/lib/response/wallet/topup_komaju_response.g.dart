// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_komaju_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupKomajuResponse _$TopupKomajuResponseFromJson(Map<String, dynamic> json) =>
    TopupKomajuResponse(
      data: json['data'] as String?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$TopupKomajuResponseToJson(
        TopupKomajuResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
