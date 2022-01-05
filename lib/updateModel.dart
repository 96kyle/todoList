import 'package:json_annotation/json_annotation.dart';

part 'updateModel.g.dart';

@JsonSerializable()
class UpdateModel {
  final String updateTitle;
  final String updateContent;
  final DateTime updateTime;

  UpdateModel({
    required this.updateTitle,
    required this.updateContent,
    required this.updateTime,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateModelToJson(this);
}
