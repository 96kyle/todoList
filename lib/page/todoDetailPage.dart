import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/page/writeTodoItemPage.dart';
import 'package:todo_list/todoModel.dart';
import 'package:todo_list/widget/updatedCard.dart';

class TodoDetailPage extends StatefulWidget {
  final TodoModel item;

  TodoDetailPage({
    Key? key,
    required this.item,
  }) : super(key: key);

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
                '${widget.item.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                decoration: widget.item.done
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
      floatingActionButton: updateButton(),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: Colors.black),
        overflow: TextOverflow.ellipsis,
        child: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              '${widget.item.title}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: widget.item.updateModelList.isEmpty
                                ? Text(
                                    '${DateFormat("yyyy-MM-dd hh:mm").format(widget.item.writeDate)} 작성')
                                : Text(
                                    '${DateFormat("yyyy-MM-dd hh:mm").format(widget.item.updateModelList.last.time)} 수정'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //TODO:수정필요
                                Text('20일남음'),
                                Text('2022-01-08완료'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                    child: Text(
                      '${widget.item.content}',
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Text(
                      '수정내역',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ...List.generate(
                    widget.item.updateModelList.isEmpty
                        ? 1
                        : widget.item.updateModelList.length,
                    (index) => widget.item.updateModelList.isEmpty
                        ? Container(
                            child: Text('수정내역이없습니다.'),
                          )
                        : UpdatedCard(
                            item: widget.item.updateModelList[index],
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toUpdate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WriteTodoItemPage(
          addTodo: false,
        ),
      ),
    );
  }

  Widget updateButton() => InkWell(
        onTap: () {
          toUpdate();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red[600],
          ),
          child: Icon(
            Icons.border_color_rounded,
            color: Colors.white,
          ),
        ),
      );
}
