import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ohyeahthat/data/model.dart';

enum SlidableAction { archive }

class Slidable_Imp_Widget extends StatefulWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;
  final Content selected_item;
  int count;

  Slidable_Imp_Widget({
    required this.child,
    required this.onDismissed,
    required this.selected_item,
    required this.count,
    Key ? key,
  }) : super(key: key);

  @override
  State<Slidable_Imp_Widget> createState() => _Slidable_Imp_WidgetState();
}

class _Slidable_Imp_WidgetState extends State<Slidable_Imp_Widget> {
  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: widget.child,

        /// left side
        actions: <Widget>[
          IconSlideAction(
            caption: '중요해제',
            color: Colors.orange,
            icon: Icons.star_rounded,
            onTap: () {
              widget.onDismissed(SlidableAction.archive);
              setState(() {
                widget.selected_item.imp = false;
                widget.count--;
              });
                print('중요공지위젯확인 : ');
                print(widget.count);
            },
          ),
        ],
      );
}