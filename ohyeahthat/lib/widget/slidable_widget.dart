
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ohyeahthat/data/model.dart';

enum SlidableAction { archive, share, more, delete }

class SlidableWidget extends StatefulWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;
  final Content selected_item;


  SlidableWidget({
    required this.child,
    required this.onDismissed,
    required this.selected_item,
    Key ? key,
  }) : super(key: key);

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: widget.child,

        /// left side
        actions: <Widget>[
          IconSlideAction(
            caption: '중요',
            color: Colors.orange,
            icon: Icons.star_border_outlined,
            onTap: () {
              setState(() {
                widget.selected_item.imp = true;
              });
                if(widget.selected_item.imp == true){
                  print('전체공지위젯확인 : ');
                }
              widget.onDismissed(SlidableAction.archive);
            }
          ),
          // IconSlideAction(
          //   caption: 'Share',
          //   color: Colors.indigo,
          //   icon: Icons.share,
          //   onTap: () => onDismissed(SlidableAction.share),
          // ),
        ],

        /// right side
        secondaryActions: <Widget>[
          // IconSlideAction(
          //   caption: 'More',
          //   color: Colors.black45,
          //   icon: Icons.more_horiz,
          //   onTap: () => onDismissed(SlidableAction.more),
          // ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => widget.onDismissed(SlidableAction.delete),
          ),
        ],
      );
}