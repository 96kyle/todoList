import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/todoModel.dart';

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage({Key? key, required this.todo}) : super(key: key);

  TodoModel todo;

  @override
  _TodoDetailPageState createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              Text(
                '${widget.todo.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                decoration: widget.todo.done
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
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      '${widget.todo.title}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    child: widget.todo.updateModelList == null
                        ? Text(
                            '${DateFormat("yyyy-MM-dd hh:mm").format(widget.todo.writeDate)} 작성',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        : Text(
                            '${widget.todo.updateModelList![widget.todo.updateModelList!.length - 1].updateTime.year}'
                            '-${widget.todo.updateModelList![widget.todo.updateModelList!.length - 1].updateTime.month}'
                            '-${widget.todo.updateModelList![widget.todo.updateModelList!.length - 1].updateTime.day} '
                            '${widget.todo.updateModelList![widget.todo.updateModelList!.length - 1].updateTime.hour}'
                            ':${widget.todo.updateModelList![widget.todo.updateModelList!.length - 1].updateTime.minute}'
                            ' 수정',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
