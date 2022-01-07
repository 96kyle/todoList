import 'package:flutter/material.dart';
import 'package:todo_list/store/todoStore.dart';

class DeleteModal extends StatelessWidget {
  final int index;
  const DeleteModal({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InkWell(
        onTap: () {
          TodoStore.instance.deleteTodo(index);
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Text('삭제하기'),
        ),
      ),
    );
  }
}
