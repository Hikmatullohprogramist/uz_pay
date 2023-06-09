// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'add_account.g.dart';

@JsonSerializable()
class AddAccount {
  final int user_id;
  final int pay_id;
  final int number;
  final int id;


  AddAccount(this.id, this.user_id, this.pay_id, this.number);

  factory AddAccount.fromJson(Map<String, dynamic> json) =>
      _$AddAccountFromJson(json);

  Map<String, dynamic> toJson() => _$AddAccountToJson(this);
}
