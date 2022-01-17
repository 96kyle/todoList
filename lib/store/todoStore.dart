import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/api/client.dart';
import 'package:todo_list/model/todo/todoModel.dart';
import 'package:todo_list/model/todo/todoRequest.dart';
import 'package:todo_list/store/userStore.dart';

part 'todoStore.g.dart';

class TodoStore extends TodoStoreBase with _$TodoStore {
  static TodoStore? _instance;

  static TodoStore get instance {
    if (_instance == null) {
      _instance = TodoStore();
    }

    return _instance!;
  }
}

abstract class TodoStoreBase with Store {
  ObservableList<TodoModel> todoList = ObservableList();
  ObservableMap<int, TodoModel> map = ObservableMap();

  final dio = Dio();

  @action
  addTodo(
    String title,
    String content,
    DateTime? dueDate,
  ) async {
    await Client().addTodo(
      TodoRequest(
        title: title,
        content: content,
        dueDate: dueDate == null ? null : dueDate.toIso8601String(),
      ),
    );
  }

  @action
  updateTodo(
    int id,
    String title,
    String content,
    DateTime? dueDate,
  ) async {
    var response = await Client().updateTodo(
      id,
      TodoRequest(
        title: title,
        content: content,
        dueDate: dueDate == null ? null : dueDate.toIso8601String(),
      ),
    );

    final key = todoList.indexWhere((v) => v.id == id);

    final item = TodoModel.fromJson(response);

    todoList[key] = item;

    todoList = ObservableList.of(todoList);
    map[id] = item;
  }

  @action
  deleteTodo(int id) async {
    var response = await Dio().delete(
      'http://192.168.0.140:5000/api/todo/${id}',
    );

    todoList.removeWhere((v) {
      return v.id == id;
    });
    map.remove(id);
  }

  @action
  switchDone(int id) async {
    var response = await Client().toggleDone(id);

    final item = TodoModel.fromJson(response);

    final key = todoList.indexWhere((v) => v.id == id);
    todoList[key] = item;
    map[id] = item;

    todoList = ObservableList.of(todoList);
  }
}
