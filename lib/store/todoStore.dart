import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  void addTodo(
    String title,
    String content,
    DateTime? selectDateTime,
  ) {
    final addItem = TodoModel(
      index: (todoList.isEmpty ? 0 : todoList.last.index) + 1,
      done: false,
      title: title,
      content: content,
      topFixed: false,
      dueDate: selectDateTime,
      writeDate: DateTime.now(),
      completeDate: null,
      updateModelList: [],
    );

    todoList.add(addItem);
    map[addItem.index] = addItem;

    selectDateTime = DateTime(0);
  }

  @action
  void updateTodo(
    int index,
    String title,
    String content,
    DateTime? selectDateTime,
  ) {
    final key = todoList.indexWhere((v) {
      return v.index == index;
    });

    final origin = todoList[key];
    final json = origin.toJson();

    json['title'] = title;
    json['content'] = content;
    json['dueDate'] = selectDateTime == null ? null : selectDateTime.toString();
    json['updateModelList'] = [];

    final result = TodoModel.fromJson(json);

    result.updateModelList
      ..clear()
      ..addAll(origin.updateModelList)
      ..add(UpdateModel(
        title: title,
        content: content,
        time: DateTime.now(),
      ));

    todoList[key] = result;

    todoList = ObservableList.of(todoList);
    map[result.index] = result;
  }

  @action
  void deleteTodo(int index) {
    todoList.removeWhere((v) {
      return v.index == index;
    });
    map.remove(index);
  }

  @action
  void switchDone(int index) {
    final key = todoList.indexWhere((v) {
      return v.index == index;
    });

    final origin = todoList[key];

    final json = origin.toJson();
    json['done'] = !origin.done;
    json['completeDate'] = json['done'] ? DateTime.now().toString() : null;
    json['updateModelList'] = [];

    final item = TodoModel.fromJson(json);

    item.updateModelList
      ..clear()
      ..addAll(origin.updateModelList);

    todoList[key] = item;
    map[item.index] = item;

    todoList = ObservableList.of(todoList);
  }
}
