import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/page/todoDetailPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/model/todoModel.dart';
import 'package:todo_list/widget/cardContent.dart';
import 'package:todo_list/widget/deleteModal.dart';
import 'package:todo_list/widget/doneCheckBox.dart';

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
  int get diff {
    return (widget.item.dueDate ?? DateTime(0))
        .difference(DateTime.now())
        .inDays;
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Material(
          child: InkWell(
            onTap: () {
              toDetail(widget.item);
            },
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteModal(
                      index: widget.item.index,
                    );
                  });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: widget.item.done
                    ? Colors.white
                    : DateTime.now()
                            .isBefore(widget.item.dueDate ?? DateTime(0))
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
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
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: CardContent(
                            dueDate: widget.item.dueDate,
                            done: widget.item.done,
                            completeDate: widget.item.completeDate,
                          )),
                    ),
                    DoneCheckBox(
                      index: widget.item.index,
                      done: widget.item.done,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void toDetail(TodoModel item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoDetailPage(item: item),
      ),
    );
  }
}
