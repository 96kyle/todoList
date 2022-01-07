import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/updateModel.dart';

part 'todoModel.g.dart';

@JsonSerializable()
class TodoModel {
  final int index;
  final bool done;
  final String title;
  final String content;
  final bool topFixed;
  final DateTime? dueDate;
  final DateTime writeDate;
  final DateTime? completeDate;
  final List<UpdateModel> updateModelList;

  TodoModel({
    required this.index,
    required this.done,
    required this.title,
    required this.content,
    required this.topFixed,
    required this.dueDate,
    required this.writeDate,
    required this.completeDate,
    required this.updateModelList,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
