import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/page/todoListPage.dart';
import 'package:todo_list/store/todoStore.dart';
import 'package:todo_list/todoModel.dart';
import 'package:todo_list/widget/dataPickerModal.dart';

class WriteTodoItemPage extends StatefulWidget {
  bool addTodo;
  TodoModel? item;

  WriteTodoItemPage({Key? key, required this.addTodo, this.item})
      : super(key: key);

  @override
  _MakeTodoItemState createState() => _MakeTodoItemState();
}

class _MakeTodoItemState extends State<WriteTodoItemPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  DateTime? selectedTime;

  String errMsg = '';

  @override
  void initState() {
    titleController.text = widget.item?.title ?? '';
    contentController.text = widget.item?.content ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
                'TODO 작성',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
              widget.addTodo
                  ? InkWell(
                      onTap: () {
                        addItem();
                      },
                      child: Text(
                        '작성',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        updateItem();
                      },
                      child: Text(
                        '수정',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text('제목'),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: widget.item != null ? widget.item!.title : '',
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                errMsg == ''
                    ? Container()
                    : Text(
                        '${errMsg}',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text('완료일'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      time(),
                      Container(
                        child: InkWell(
                          onTap: () {
                            showDatePickerModal();
                          },
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text('내용'),
                ),
                TextField(
                  controller: contentController,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: widget.item != null ? widget.item!.content : '',
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget time() => Container(
        child: Text(
          selectedTime != null
              ? DateFormat("yyyy년 MM월 dd일").format(selectedTime!)
              : widget.item?.dueDate != null
                  ? DateFormat("yyyy년 MM월 dd일").format(widget.item!.dueDate!)
                  : '',
        ),
      );

  Future showDatePickerModal() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return DatePickerModal();
      },
    );

    if (result == null) {
      return;
    }

    setState(() {
      selectedTime = result;
    });
  }

  void addItem() {
    if (titleController.text == '') {
      setState(() {
        errMsg = '제목은 필수 항목입니다.';
      });
      return;
    }

    TodoStore.instance.addTodo(
      titleController.text,
      contentController.text,
      selectedTime,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoListPage(),
      ),
    );
  }

  void updateItem() {
    if (titleController.text == '') {
      setState(() {
        errMsg = '제목은 필수 항목입니다.';
      });
      return;
    }

    TodoStore.instance.updateTodo(
      widget.item!.index,
      titleController.text,
      contentController.text,
      selectedTime,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoListPage(),
      ),
    );
  }
}
