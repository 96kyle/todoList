import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/model/todoModel.dart';
import 'package:todo_list/model/updateModel.dart';

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

  @action
  addTodo(
    String title,
    String content,
    DateTime? dueDate,
  ) async {
    await Dio().post(
      'http://192.168.0.140:5000/api/todo',
      data: {
        "title": title,
        "content": content,
        "dueDate": dueDate == null ? null : dueDate.toIso8601String(),
      },
    );

    // final addItem = TodoModel(
    //   index: (todoList.isEmpty ? 0 : todoList.last.index) + 1,
    //   isDone: false,
    //   title: title,
    //   content: content,
    //   isTopFixed: false,
    //   dueDate: selectDateTime,
    //   createdTime: DateTime.now(),
    //   completeDate: null,
    //   updateModelList: [],
    // );

    // todoList.add(addItem);
    // map[addItem.index] = addItem;

    // selectDateTime = DateTime(0);
  }

  @action
  updateTodo(
    int id,
    String title,
    String content,
    DateTime? dueDate,
  ) async {
    var response = await Dio().put(
      'http://192.168.0.140:5000/api/todo/${id}',
      data: {
        "title": title,
        "content": content,
        "dueDate": dueDate == null ? null : dueDate.toIso8601String(),
      },
    );

    final key = todoList.indexWhere((v) => v.id == id);

    final item = TodoModel.fromJson(response.data);

    todoList[key] = item;

    todoList = ObservableList.of(todoList);
    map[id] = item;
  }

  @action
  void deleteTodo(int id) async {
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
    var response = await Dio().put(
      'http://192.168.0.140:5000/api/todo/${id}/toggledone',
    );

    final item = TodoModel.fromJson(response.data);

    final key = todoList.indexWhere((v) => v.id == id);
    todoList[key] = item;
    map[id] = item;

    todoList = ObservableList.of(todoList);
  }
}
