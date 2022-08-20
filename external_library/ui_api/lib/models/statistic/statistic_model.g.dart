// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticModel _$StatisticModelFromJson(Map<String, dynamic> json) =>
    StatisticModel(
      balance: (json['balance'] as num?)?.toDouble(),
      refundsBySupplier: (json['refunds_by_supplier'] as num?)?.toDouble(),
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      finedAmount: (json['fined_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StatisticModelToJson(StatisticModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'refunds_by_supplier': instance.refundsBySupplier,
      'amount_total': instance.amountTotal,
      'fined_amount': instance.finedAmount,
    };
