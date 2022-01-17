import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/api/client.dart';
import 'package:todo_list/model/todo/todoModel.dart';
import 'package:todo_list/page/loginPage.dart';
import 'package:todo_list/page/todoDetailPage.dart';
import 'package:todo_list/page/writeTodoItemPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/store/userStore.dart';
import 'package:todo_list/widget/todoCard.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();

    load();
  }

  load() async {
    final response = await Client().getTodoList();
    print(response);
    if (response is List) {
      final list = response;
      TodoStore.instance.todoList
        ..clear()
        ..addAll(list.map((e) {
          final item = TodoModel.fromJson(e);
          TodoStore.instance.map[item.id] = item;

          return item;
        }));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff990000),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Todo Practice',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 25,
            ),
          ),
        ),
      ),
      floatingActionButton: fabButton(),
      body: Observer(
        builder: (_) => Container(
          alignment: Alignment.center,
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: TodoStore.instance.todoList.length,
            itemBuilder: (_, index) => Observer(
              builder: (_) => TodoCard(
                item: TodoStore.instance.todoList[index],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          UserStore.instance.logOut();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Text('로그아웃'),
        ),
      ),
    );
  }

  void toWrite() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WriteTodoItemPage(
          addTodo: true,
        ),
      ),
    );
  }

  Widget fabButton() => InkWell(
        onTap: () {
          toWrite();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red[600],
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      );
}
