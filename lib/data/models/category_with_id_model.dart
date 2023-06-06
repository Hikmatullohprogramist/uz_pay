// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'category_with_id_model.g.dart';

@JsonSerializable()
class CategoryModelWithID {
  final int id;
  final int category_id;
  final String name;
  final String image;


  CategoryModelWithID(this.id, this.category_id, this.name, this.image );

  factory CategoryModelWithID.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelWithIDFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelWithIDToJson(this);
}
