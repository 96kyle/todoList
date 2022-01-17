// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      isDone: json['isDone'] as bool,
      title: json['title'] as String,
      content: json['content'] as String,
      isTopFixed: json['isTopFixed'] as bool,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      createdTime: DateTime.parse(json['createdTime'] as String),
      updatedTime: DateTime.parse(json['updatedTime'] as String),
      completedTime: json['completedTime'] == null
          ? null
          : DateTime.parse(json['completedTime'] as String),
      todoHistories: (json['todoHistories'] as List<dynamic>)
          .map((e) => UpdateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'isDone': instance.isDone,
      'title': instance.title,
      'content': instance.content,
      'isTopFixed': instance.isTopFixed,
      'dueDate': instance.dueDate?.toIso8601String(),
      'createdTime': instance.createdTime.toIso8601String(),
      'updatedTime': instance.updatedTime.toIso8601String(),
      'completedTime': instance.completedTime?.toIso8601String(),
      'todoHistories': instance.todoHistories,
    };
