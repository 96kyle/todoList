import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:todo_list/model/todoModel.dart';
import 'package:todo_list/model/todoRequest.dart';

part 'client.g.dart';

@RestApi(baseUrl: "http://192.168.0.140:5000/api/todo")
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  @GET("/")
  Future<dynamic> getTodoList();

  @POST("/")
  Future<dynamic> addTodo(@Body() TodoRequest todoRequest);

  @PUT("/{id}")
  Future<dynamic> updateTodo(@Path() int id, @Body() TodoRequest todoRequest);

  @PUT("/{id}/toggledone")
  Future<dynamic> toggleDone(@Path() int id);
}
