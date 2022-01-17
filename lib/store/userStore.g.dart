// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on UserStoreBase, Store {
  final _$idAtom = Atom(name: 'UserStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$possibleRegisterAtom = Atom(name: 'UserStoreBase.possibleRegister');

  @override
  bool get possibleRegister {
    _$possibleRegisterAtom.reportRead();
    return super.possibleRegister;
  }

  @override
  set possibleRegister(bool value) {
    _$possibleRegisterAtom.reportWrite(value, super.possibleRegister, () {
      super.possibleRegister = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('UserStoreBase.register');

  @override
  Future register(RegisterRequest request) {
    return _$registerAsyncAction.run(() => super.register(request));
  }

  final _$loginAsyncAction = AsyncAction('UserStoreBase.login');

  @override
  Future login(LoginRequest request) {
    return _$loginAsyncAction.run(() => super.login(request));
  }

  final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase');

  @override
  dynamic logOut() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.logOut');
    try {
      return super.logOut();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
possibleRegister: ${possibleRegister}
    ''';
  }
}
