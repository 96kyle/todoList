import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/page/todoDetailPage.dart';
import 'package:todo_list/page/writeTodoItemPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/todoModel.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
      body: Stack(
        children: [
          Observer(
            builder: (_) => Container(
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: TodoStore.instance.todoList.length,
                itemBuilder: (_, index) => TodoCard(
                  TodoStore.instance.todoList[index],
                  index,
                  width,
                ),
              ),
            ),
          ),
          Positioned(
            top: height - 150,
            left: width - 70,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WriteTodoItemPage(
                      addTodo: true,
                    ),
                  ),
                );
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
            ),
          ),
        ],
      ),
    );
  }

  Widget TodoCard(TodoModel item, int index, double width) {
    return InkWell(
      onTap: () {
        TodoModel todo = TodoStore.instance.selectTodo(item.index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoDetailPage(todo: todo),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 0,
          left: 10,
          right: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: item.done
              ? Colors.white
              : DateTime.now().isBefore(item.dueDate)
                  ? Colors.yellow[300]
                  : Colors.red[100],
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 5,
              ),
              width: 0.29 * width,
              child: Text(
                '${item.title}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: item.updateModelList == null
                  ? Text(
                      '${item.writeDate.year}'
                      '-${item.writeDate.month}'
                      '-${item.writeDate.day} '
                      '${item.writeDate.hour}'
                      ':${item.writeDate.minute}'
                      ' 작성',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  : Text(
                      '${item.updateModelList![item.updateModelList!.length - 1].updateTime.year}'
                      '-${item.updateModelList![item.updateModelList!.length - 1].updateTime.month}'
                      '-${item.updateModelList![item.updateModelList!.length - 1].updateTime.day} '
                      '${item.updateModelList![item.updateModelList!.length - 1].updateTime.hour}'
                      ':${item.updateModelList![item.updateModelList!.length - 1].updateTime.minute}'
                      ' 수정',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
            ),
            Container(
              child: Column(
                children: [
                  // Text(),
                  // Text(),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                TodoStore.instance.switchDone(item.index);
              },
              child: Container(
                decoration: item.done
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
