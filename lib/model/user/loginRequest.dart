import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loginRequest.g.dart';

@JsonSerializable()
class LoginRequest {
  final String id;
  final String password;

  LoginRequest({
    required this.id,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
