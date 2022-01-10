import 'package:json_annotation/json_annotation.dart';

part 'updateModel.g.dart';

@JsonSerializable()
class UpdateModel {
  final String title;
  final String content;
  final DateTime time;

  UpdateModel({
    required this.title,
    required this.content,
    required this.time,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateModelToJson(this);
}
