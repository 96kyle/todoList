import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/store/todoStore.dart';

class DatePickerModal extends StatefulWidget {
  const DatePickerModal({
    Key? key,
  }) : super(key: key);

  @override
  _DatePickerModalState createState() => _DatePickerModalState();
}

class _DatePickerModalState extends State<DatePickerModal> {
  DateTime selectTime = DateTime.now();

  @override
  Widget build(BuildContext context) => Dialog(
        child: Container(
          height: 300,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectTime,
                    onDateTimeChanged: (DateTime newDateTime) {
                      selectTime = newDateTime;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(selectTime);
                    },
                    child: Text('선택 완료'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
