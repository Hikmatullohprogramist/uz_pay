// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAccount _$AddAccountFromJson(Map<String, dynamic> json) => AddAccount(
      json['id'] as int,
      json['user_id'] as int,
      json['pay_id'] as int,
      json['number'] as int,
    );

Map<String, dynamic> _$AddAccountToJson(AddAccount instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'pay_id': instance.pay_id,
      'number': instance.number,
      'id': instance.id,
    };
