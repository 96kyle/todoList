// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      index: json['index'] as int,
      done: json['done'] as bool,
      title: json['title'] as String,
      content: json['content'] as String,
      topFixed: json['topFixed'] as bool,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      writeDate: DateTime.parse(json['writeDate'] as String),
      completeDate: json['completeDate'] == null
          ? null
          : DateTime.parse(json['completeDate'] as String),
      updateModelList: (json['updateModelList'] as List<dynamic>)
          .map((e) => UpdateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'index': instance.index,
      'done': instance.done,
      'title': instance.title,
      'content': instance.content,
      'topFixed': instance.topFixed,
      'dueDate': instance.dueDate?.toIso8601String(),
      'writeDate': instance.writeDate.toIso8601String(),
      'completeDate': instance.completeDate?.toIso8601String(),
      'updateModelList': instance.updateModelList,
    };
