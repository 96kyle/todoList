import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/page/writeTodoItemPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/todoModel.dart';
import 'package:todo_list/widget/cardContent.dart';
import 'package:todo_list/widget/doneCheckBox.dart';
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
  int get diff {
    return (item?.dueDate ?? DateTime(0)).difference(DateTime.now()).inDays;
  }

  TodoModel? get item {
    return TodoStore.instance.map[widget.item.index];
  }

  @override
  void initState() {
    super.initState();
  }

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
                '${item?.title ?? ''}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Observer(
                builder: (_) => item == null
                    ? Container()
                    : DoneCheckBox(
                        index: item!.index,
                        done: item!.done,
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: updateButton(),
      body: DefaultTextStyle(
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
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
                              '${item?.title ?? ''}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: item == null
                                ? Container()
                                : item!.updateModelList.isEmpty
                                    ? Text(
                                        '${DateFormat("yyyy-MM-dd hh:mm").format(item!.writeDate)} 작성',
                                      )
                                    : Text(
                                        '${DateFormat("yyyy-MM-dd hh:mm").format(item!.updateModelList.last.time)} 수정',
                                      ),
                          ),
                        ),
                        Observer(
                          builder: (_) => Expanded(
                            child: item == null
                                ? Container()
                                : Container(
                                    child: CardContent(
                                      dueDate: item!.dueDate,
                                      done: item!.done,
                                      completeDate: item!.completeDate,
                                    ),
                                  ),
                          ),
                        ),
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
                      '${item?.content ?? ''}',
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
                  ...item == null
                      ? []
                      : List.generate(
                          item!.updateModelList.isEmpty
                              ? 1
                              : item!.updateModelList.length,
                          (index) => item!.updateModelList.isEmpty
                              ? Container(
                                  child: Text('수정내역이없습니다.'),
                                )
                              : UpdatedCard(
                                  item: item!.updateModelList[index],
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

  void toUpdate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WriteTodoItemPage(
          addTodo: false,
          item: item,
        ),
      ),
    );
  }
}
