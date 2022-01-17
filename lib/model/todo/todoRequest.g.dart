// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoRequest _$TodoRequestFromJson(Map<String, dynamic> json) => TodoRequest(
      title: json['title'] as String,
      content: json['content'] as String,
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$TodoRequestToJson(TodoRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'dueDate': instance.dueDate,
    };
