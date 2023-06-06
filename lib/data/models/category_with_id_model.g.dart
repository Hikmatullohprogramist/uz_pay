// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_with_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModelWithID _$CategoryModelWithIDFromJson(Map<String, dynamic> json) =>
    CategoryModelWithID(
      json['id'] as int,
      json['category_id'] as int,
      json['name'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$CategoryModelWithIDToJson(
        CategoryModelWithID instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'name': instance.name,
      'image': instance.image,
    };
