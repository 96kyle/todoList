// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateModel _$UpdateModelFromJson(Map<String, dynamic> json) => UpdateModel(
      title: json['title'] as String,
      content: json['content'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$UpdateModelToJson(UpdateModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'time': instance.time.toIso8601String(),
    };
