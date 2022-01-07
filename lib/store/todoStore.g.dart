// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on TodoStoreBase, Store {
  final _$TodoStoreBaseActionController =
      ActionController(name: 'TodoStoreBase');

  @override
  void addTodo(String title, String content, DateTime? selectDateTime) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.addTodo');
    try {
      return super.addTodo(title, content, selectDateTime);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTodo(
      int index, String title, String content, DateTime? selectDateTime) {
    final _$actionInfo = _$TodoStoreBaseActionController.startAction(
        name: 'TodoStoreBase.updateTodo');
    try {
      return super.updateTodo(index, title, content, selectDateTime);
    } finally {
      _$TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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

    ''';
  }
}
