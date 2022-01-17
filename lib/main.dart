import 'package:flutter/material.dart';
import 'package:todo_list/page/loginPage.dart';
import 'package:todo_list/page/todoDetailPage.dart';
import 'package:todo_list/page/todoListPage.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
