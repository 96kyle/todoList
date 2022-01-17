import 'package:json_annotation/json_annotation.dart';

part 'updateModel.g.dart';

@JsonSerializable()
class UpdateModel {
  final int id;
  final int todoId;
  final String title;
  final String content;
  final DateTime createdTime;

  UpdateModel({
    required this.id,
    required this.todoId,
    required this.title,
    required this.content,
    required this.createdTime,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateModelToJson(this);
}
