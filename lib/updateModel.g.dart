// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateModel _$UpdateModelFromJson(Map<String, dynamic> json) => UpdateModel(
      updateTitle: json['updateTitle'] as String,
      updateContent: json['updateContent'] as String,
      updateTime: DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$UpdateModelToJson(UpdateModel instance) =>
    <String, dynamic>{
      'updateTitle': instance.updateTitle,
      'updateContent': instance.updateContent,
      'updateTime': instance.updateTime.toIso8601String(),
    };
