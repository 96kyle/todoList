// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on TodoStoreBase, Store {
  final _$todoListAtom = Atom(name: 'TodoStoreBase.todoList');

  @override
  ObservableList<TodoModel> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoModel> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$TodoStoreBaseActionController =
      ActionController(name: 'TodoStoreBase');

  @override
  void addTodo() {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getTodoList() {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.getTodoList');
    try {
      return super.getTodoList();
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoModel selectTodo(int index) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.selectTodo');
    try {
      return super.selectTodo(index);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchDone(int index) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.switchDone');
    try {
      return super.switchDone(index);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList}
    ''';
  }
}