import 'package:flutter/material.dart';
import 'package:ohyeahthat/data/data.dart';
import 'package:ohyeahthat/data/model.dart';
import 'package:ohyeahthat/widget/slidable_widget.dart';
import 'package:ohyeahthat/widget/utils.dart';

class AllNotiScreen extends StatefulWidget{
  const AllNotiScreen({Key? key}) : super(key: key);

  @override
  _AllNotiScreen createState() => _AllNotiScreen();
} 
class _AllNotiScreen extends State<AllNotiScreen> {
  List<Content> item = List.of(Data.contents);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView.separated(
          itemCount: item.length,
          separatorBuilder: (context, index){
            return const Divider(
              thickness: 5,
            );
          },
          itemBuilder: (context,index) {
            final items = item[index];
            return SlidableWidget(
              child : buildListTile(items),
              onDismissed:(action) =>
                dismissSlidableItem(context,index,action),
              selected_item: items,
            );
          }
        ),
      )
    )
  );
}



void dismissSlidableItem(BuildContext context, int index, action) {
  setState((){
    item.removeAt(index);
  });
  switch (action) {
    case SlidableAction.archive:
      Utils.showSnackBar(context, '중요공지에 저장되었습니다.');
      break;
    case SlidableAction.delete:
      Utils.showSnackBar(context, '삭제되었습니다.');
      break;
    }
}

Widget buildListTile(Content item){
  return  ListTile(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  ),
  // leading: CircleAvatar(
  //   radius: 28,
  //   backgroundImage: NetworkImage(item.urlAvatar),
  // ),
  title : Row(
    children: [
      Chip(
        label: Text(item.keyword),
        backgroundColor: Colors.blue,
      )
    ],),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        item.keyword,
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(item.title.length > 30)
            for(int i=0; i < 30; i++)
              Text(item.title[i]),
            if(item.title.length < 30)
              Text(item.title),
            ],
        ),
      const SizedBox(height: 4),
        Text(item.writer),
      ],
    ),
    onTap: () {},
  );
  }
}

  