import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/model/todo/updateModel.dart';

part 'todoModel.g.dart';

@JsonSerializable()
class TodoModel {
  final int id;
  final int userId;
  final bool isDone;
  final String title;
  final String content;
  final bool isTopFixed;
  final DateTime? dueDate;
  final DateTime createdTime;
  final DateTime updatedTime;
  final DateTime? completedTime;
  final List<UpdateModel> todoHistories;

  TodoModel({
    required this.id,
    required this.userId,
    required this.isDone,
    required this.title,
    required this.content,
    required this.isTopFixed,
    required this.dueDate,
    required this.createdTime,
    required this.updatedTime,
    required this.completedTime,
    required this.todoHistories,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
