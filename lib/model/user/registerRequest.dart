import 'package:json_annotation/json_annotation.dart';

part 'registerRequest.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String id;
  final String password;
  final String name;

  RegisterRequest({
    required this.id,
    required this.password,
    required this.name,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
