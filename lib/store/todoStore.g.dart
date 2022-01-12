// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on TodoStoreBase, Store {
  final _$addTodoAsyncAction = AsyncAction('TodoStoreBase.addTodo');

  @override
  Future addTodo(String title, String content, DateTime? dueDate) {
    return _$addTodoAsyncAction
        .run(() => super.addTodo(title, content, dueDate));
  }

  final _$updateTodoAsyncAction = AsyncAction('TodoStoreBase.updateTodo');

  @override
  Future updateTodo(int id, String title, String content, DateTime? dueDate) {
    return _$updateTodoAsyncAction
        .run(() => super.updateTodo(id, title, content, dueDate));
  }

  final _$switchDoneAsyncAction = AsyncAction('TodoStoreBase.switchDone');

  @override
  Future switchDone(int id) {
    return _$switchDoneAsyncAction.run(() => super.switchDone(id));
  }

  final _$TodoStoreBaseActionController =
      ActionController(name: 'TodoStoreBase');

  @override
  void deleteTodo(int index) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.deleteTodo');
    try {
      return super.deleteTodo(index);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
