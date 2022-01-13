import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/model/updateModel.dart';

part 'todoRequest.g.dart';

@JsonSerializable()
class TodoRequest {
  final String title;
  final String content;
  final String? dueDate;

  TodoRequest({
    required this.title,
    required this.content,
    required this.dueDate,
  });

  factory TodoRequest.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TodoRequestToJson(this);
}
