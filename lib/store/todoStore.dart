import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/todoModel.dart';
import 'package:todo_list/updateModel.dart';

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
  List<TodoModel> data = [
    TodoModel(
      index: 1,
      done: false,
      title: 'Todo item 제목',
      content: 'qwe',
      topFixed: false,
      dueDate: DateTime(2022, 1, 3, 5, 4, 30),
      writeDate: DateTime.now(),
      updateModelList: [
        UpdateModel(
          updateTitle: '수정사항1',
          updateContent: '수정내용',
          updateTime: DateTime.now(),
        ),
        UpdateModel(
          updateTitle: '수정사항2',
          updateContent: '수정내용',
          updateTime: DateTime.now(),
        ),
        UpdateModel(
          updateTitle: '수정사항3',
          updateContent: '수정내용',
          updateTime: DateTime.now(),
        )
      ],
    ),
    TodoModel(
      index: 2,
      done: true,
      title: 'Todo item 제목',
      content: 'qwe',
      topFixed: false,
      dueDate: DateTime.now(),
      writeDate: DateTime.now(),
      updateModelList: null,
    ),
    TodoModel(
      index: 3,
      done: false,
      title: 'Todo item 제목',
      content: 'qwe',
      topFixed: false,
      dueDate: DateTime(2022, 1, 6, 5, 4, 30),
      writeDate: DateTime.now(),
      updateModelList: null,
    ),
    TodoModel(
      index: 4,
      done: true,
      title: 'Todo item 제목',
      content: 'qwe',
      topFixed: false,
      dueDate: DateTime.now(),
      writeDate: DateTime.now(),
      updateModelList: null,
    )
  ];

  @observable
  ObservableList<TodoModel> todoList = ObservableList();

  @action
  void addTodo() {}

  @action
  void getTodoList() {
    //api에서 호출받은 데이터 넣어야함 지금은 없으므로 더미데이터 넣었음
    todoList.addAll(data);
  }

  @action
  TodoModel selectTodo(int index) {
    List<TodoModel> a = data.where((v) {
      return v.index == index;
    }).toList();

    return a[0];
  }

  @action
  void switchDone(int index) {
    final a = data.indexWhere((v) {
      return v.index == index;
    });

    data[a].done = !data[a].done;
    todoList.clear();
    todoList.addAll(data);
  }
}
