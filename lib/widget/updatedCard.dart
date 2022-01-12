import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/model/updateModel.dart';

class UpdatedCard extends StatefulWidget {
  final UpdateModel item;

  const UpdatedCard({Key? key, required this.item}) : super(key: key);

  @override
  _UpdatedCardState createState() => _UpdatedCardState();
}

class _UpdatedCardState extends State<UpdatedCard> {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.1),
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
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '${widget.item.title}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '${widget.item.content}',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      '${DateFormat("yyyy-MM-dd hh:mm").format(widget.item.createdTime)} 수정'),
                ),
              ),
            ],
          ),
        ),
      );
}
