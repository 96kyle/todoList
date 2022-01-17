// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      id: json['id'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'name': instance.name,
    };
