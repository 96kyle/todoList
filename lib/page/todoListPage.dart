import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/page/todoDetailPage.dart';
import 'package:todo_list/page/writeTodoItemPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/widget/todoCard.dart';
import 'package:todo_list/todoModel.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    load();
  }

  void load() {
    TodoStore.instance.getTodoList();
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
            itemBuilder: (_, index) =>
                TodoCard(item: TodoStore.instance.todoList[index]),
          ),
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
