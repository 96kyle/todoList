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
  @observable
  List<TodoModel> data = [];
//------------ 날짜 선택 관련 ---------------
  @observable
  DateTime selectDateTime = DateTime(0);

  @action
  void getTime(DateTime selectTime) {
    selectDateTime = selectTime;
  }

//-------------------------------------------

  @observable
  ObservableList<TodoModel> todoList = ObservableList();

  @action
  void addTodo(String title, String content) {
    final addItem = TodoModel(
      index: data.length + 1,
      done: false,
      title: title,
      content: content,
      topFixed: false,
      dueDate: selectDateTime,
      writeDate: DateTime.now(),
      completeDate: DateTime(0),
      updateModelList: [],
    );

    data.add(addItem);
    todoList.clear();
    todoList.addAll(data);

    selectDateTime = DateTime(0);
  }

//--------------------update-------------------------------------------
  @action
  void updateTodo(
    String title,
    String content,
    int index,
    List<UpdateModel> updateModelList,
  ) {
    final a = data.indexWhere((v) {
      return v.index == index;
    });

    final json = data[a].toJson();

    List<dynamic> updateData = [];

    if (updateModelList.isNotEmpty) {
      for (int i = 0; i < updateModelList.length; i++) {
        updateData.add(UpdateModel(
          title: updateModelList[i].title,
          content: updateModelList[i].content,
          time: updateModelList[i].time,
        ).toJson());
      }
    }

    updateData.add(UpdateModel(
      title: title,
      content: content,
      time: DateTime.now(),
    ).toJson());

    json['title'] = title;
    json['content'] = content;
    json['dueDate'] = selectDateTime.toString();
    json['updateModelList'] = updateData;

    final newItem = TodoModel.fromJson(json);

    data[a] = newItem;

    todoList.clear();
    todoList.addAll(data);

    selectDateTime = DateTime(0);
  }

//-----------------------------------------------------------------------

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

    List<dynamic> updateData = [];

    if (data[a].updateModelList.isNotEmpty) {
      for (int i = 0; i < data[a].updateModelList.length; i++) {
        updateData.add(UpdateModel(
          title: data[a].updateModelList[i].title,
          content: data[a].updateModelList[i].content,
          time: data[a].updateModelList[i].time,
        ).toJson());
      }
    }

    final json = data[a].toJson();
    json['done'] = !data[a].done;
    json['updateModelList'] = updateData;
    if (json['done'] == true) {
      json['completeDate'] = DateTime.now().toString();
    } else {
      json['completeDate'] = DateTime(0).toString();
    }

    final newItem = TodoModel.fromJson(json);
    data[a] = newItem;
    todoList.clear();
    todoList.addAll(data);
  }
}
