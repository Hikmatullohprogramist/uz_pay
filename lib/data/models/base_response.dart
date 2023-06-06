
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{
  final bool success;
  final String message;
  final int error_code;
  final dynamic data;

  BaseResponse(this.success, this.message, this.error_code, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json)=>_$BaseResponseFromJson(json);

  Map<String, dynamic> toJson()=> _$BaseResponseToJson(this);


}