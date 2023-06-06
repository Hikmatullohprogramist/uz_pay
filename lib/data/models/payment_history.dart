// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'payment_history.g.dart';

@JsonSerializable()
class PaymentHistoroyModel {
  final int id;
  final int pay_id;
  final int user_id;
  final int account_id;
  final int summa;
  final int card_id;
  final String created_at;
  final String account_number;
  final String from_card;
  final String to_service;
  final String date;



  PaymentHistoroyModel(this.id, this.pay_id, this.user_id, this.account_id, this.summa, this.card_id, this.created_at, this.account_number, this.from_card, this.to_service, this.date);

  factory PaymentHistoroyModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoroyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentHistoroyModelToJson(this);
}
