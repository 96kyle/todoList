import 'package:flutter/material.dart';
import 'package:todo_list/store/todoStore.dart';

class DoneCheckBox extends StatelessWidget {
  final int index;
  final bool done;

  const DoneCheckBox({
    Key? key,
    required this.index,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          TodoStore.instance.switchDone(index);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done ? Colors.green : Colors.white,
            border: Border.all(
              width: 1,
              color: done ? Colors.green : Colors.black,
            ),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      );
}
