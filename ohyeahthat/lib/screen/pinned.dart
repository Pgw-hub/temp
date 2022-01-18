import 'package:flutter/material.dart';
import 'package:ohyeahthat/data/data.dart';
import 'package:ohyeahthat/data/model.dart';
import 'package:ohyeahthat/widget/slidable_pinned.dart';
import 'package:ohyeahthat/widget/utils.dart';

class PinnedScreen extends StatefulWidget{
  const PinnedScreen({Key? key}) : super(key: key);

  @override
  State<PinnedScreen> createState() => _PinnedScreenState();
}

class _PinnedScreenState extends State<PinnedScreen> {
  List<Content> item = List.of(Data.contents);
  int imp_count = 0;

  @override
  Widget build(BuildContext context) {
    imp_count = 0;
    for(int i=0; i<item.length; i++){
      if(item[i].imp == true){
        imp_count++;
      }
    }
    return Scaffold(
      appBar : AppBar(
        title : const Text("중요공지"),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.separated(
          itemCount: imp_count,
          separatorBuilder: (context, index){
            return const Divider(
              thickness: 5,
            );
          },
          itemBuilder: (context,index) {
            final items = item[index];
            // for(int i=0; i<item.length;i++){
            //   if(items.imp == true)
            //     imp_item!.add(items);
            // }
            // final imp_items = imp_item![index];
            return Slidable_Imp_Widget(
              child: buildListTile(items),
              onDismissed:(action) =>
                dismissSlidableItem(context,index,action),
              selected_item: items,
              count : imp_count,
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
    }
}

Widget buildListTile(Content item){
  print('중요빌드타일 : ');
  print(imp_count);
  if(item.imp == true){
    return ListTile(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
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
  else{
    return ListTile();//true가 아니면 아무것도 보내지 마라 제발 아무것도 보내지마
  }
}
}