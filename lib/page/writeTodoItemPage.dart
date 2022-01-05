import 'package:flutter/material.dart';

class WriteTodoItemPage extends StatefulWidget {
  WriteTodoItemPage({Key? key, required this.addTodo, this.item})
      : super(key: key);

  bool addTodo;
  String? item;

  @override
  _MakeTodoItemState createState() => _MakeTodoItemState();
}

class _MakeTodoItemState extends State<WriteTodoItemPage> {
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
                  ? Text(
                      '작성',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    )
                  : Text(
                      '수정',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
            ],
          ),
        ),
      ),
      body: SafeArea(
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
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                alignment: Alignment.centerLeft,
                child: Text('완료일'),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
                style: TextStyle(
                  fontSize: 14,
                ),
                maxLines: 10,
                decoration: InputDecoration(
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
    );
  }
}
