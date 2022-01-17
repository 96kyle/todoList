import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:todo_list/model/todo/todoRequest.dart';
import 'package:todo_list/model/user/loginRequest.dart';
import 'package:todo_list/model/user/registerRequest.dart';

part 'client.g.dart';

@RestApi()
abstract class Client {
  static String token = '';

  factory Client() => _Client(
        Dio(
          BaseOptions(
            baseUrl: "http://192.168.0.140:5000/api/",
            headers: {
              ...token.isNotEmpty ? {'Authorization': 'bearer ${token}'} : {},
            },
          ),
        ),
      );

  @POST("/user/login")
  Future<dynamic> login(@Body() LoginRequest userRequest);

  @POST("/user")
  Future<dynamic> register(@Body() RegisterRequest registerRequest);

  //---------------------------------------------------------------------------

  @GET("/todo")
  Future<dynamic> getTodoList();

  @POST("/todo")
  Future<dynamic> addTodo(@Body() TodoRequest todoRequest);

  @PUT("/todo/{todoId}")
  Future<dynamic> updateTodo(
      @Path() int todoId, @Body() TodoRequest todoRequest);

  @PUT("/todo/{todoId}/toggledone")
  Future<dynamic> toggleDone(@Path() int todoId);
}
