import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/page/todoDetailPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/todoModel.dart';

class TodoCard extends StatefulWidget {
  final TodoModel item;

  const TodoCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Material(
          child: InkWell(
            onTap: () {
              toDetail(widget.item.index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: widget.item.done
                    ? Colors.white
                    : DateTime.now().isBefore(widget.item.dueDate)
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
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 5,
                        ),
                        child: Text(
                          '${widget.item.title}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: widget.item.updateModelList.isEmpty
                            ? Text(
                                '${DateFormat("yyyy-MM-dd hh:mm").format(widget.item.writeDate)} 작성',
                              )
                            : Text(
                                '${DateFormat("yyyy-MM-dd hh:mm").format(widget.item.updateModelList.last.time)} 수정',
                              ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          //TODO:작성필요
                          // Text(),
                          // Text(),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        TodoStore.instance.switchDone(widget.item.index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.item.done ? Colors.green : Colors.white,
                          border: Border.all(
                            width: 1,
                            color:
                                widget.item.done ? Colors.green : Colors.black,
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
            ),
          ),
        ),
      );

  void toDetail(int index) {
    TodoModel todo = TodoStore.instance.selectTodo(index);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoDetailPage(item: todo),
      ),
    );
  }
}
