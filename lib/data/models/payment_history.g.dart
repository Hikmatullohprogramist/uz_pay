// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoroyModel _$PaymentHistoroyModelFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoroyModel(
      json['id'] as int,
      json['pay_id'] as int,
      json['user_id'] as int,
      json['account_id'] as int,
      json['summa'] as int,
      json['card_id'] as int,
      json['created_at'] as String,
      json['account_number'] as String,
      json['from_card'] as String,
      json['to_service'] as String,
      json['date'] as String,
    );

Map<String, dynamic> _$PaymentHistoroyModelToJson(
        PaymentHistoroyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pay_id': instance.pay_id,
      'user_id': instance.user_id,
      'account_id': instance.account_id,
      'summa': instance.summa,
      'card_id': instance.card_id,
      'created_at': instance.created_at,
      'account_number': instance.account_number,
      'from_card': instance.from_card,
      'to_service': instance.to_service,
      'date': instance.date,
    };
