// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateModel _$UpdateModelFromJson(Map<String, dynamic> json) => UpdateModel(
      id: json['id'] as int,
      todoId: json['todoId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      createdTime: DateTime.parse(json['createdTime'] as String),
    );

Map<String, dynamic> _$UpdateModelToJson(UpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todoId': instance.todoId,
      'title': instance.title,
      'content': instance.content,
      'createdTime': instance.createdTime.toIso8601String(),
    };
