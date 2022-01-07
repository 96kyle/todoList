import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardContent extends StatelessWidget {
  final DateTime? dueDate;
  final bool done;
  final DateTime? completeDate;

  const CardContent({
    Key? key,
    required this.dueDate,
    required this.done,
    required this.completeDate,
  }) : super(key: key);

  int get diff {
    return (dueDate ?? DateTime(0)).difference(DateTime.now()).inDays;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          dueDate == null || done == true
              ? Container()
              : Text(
                  diff == 0
                      ? '당일'
                      : diff > 0
                          ? '${diff + 1}일 남음'
                          : '${-diff}일 초과',
                ),
          dueDate == null
              ? Container()
              : Text(
                  '${DateFormat("yyyy-MM-dd").format(dueDate!)} 까지',
                ),
          done == true && completeDate != null
              ? Text(
                  '${DateFormat("yyyy-MM-dd").format(completeDate!)} 완료',
                )
              : Container()
        ],
      );
}
