
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  final int id;
  final String token;


  LoginResponse(this.id, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json)=>_$LoginResponseFromJson(json);

  Map<String, dynamic> toJson()=> _$LoginResponseToJson(this);


}