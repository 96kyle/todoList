import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/model/todo/todoModel.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String password;
  final List<TodoModel> todoList;

  UserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.todoList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
