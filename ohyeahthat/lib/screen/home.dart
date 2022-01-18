import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohyeahthat/controller/home_controller.dart';
import 'package:ohyeahthat/screen/all_noti.dart';
import 'package:ohyeahthat/screen/pinned.dart';
import 'package:ohyeahthat/screen/settings.dart';
import 'package:ohyeahthat/theme/colors.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text(
            _appBarTitle(controller.currentIndex.value),
            style: const TextStyle(
              fontFamily: 'main',
              fontSize: 20,
            ),
          ),
          actions : <Widget>[
            IconButton(
              icon : const Icon(Icons.push_pin),
              onPressed: (){
                Get.to(const PinnedScreen());
              })
          ],
          backgroundColor: primary,
        ),
        body: IndexedStack(
            index: controller.currentIndex.value,
            children: const [AllNotiScreen(), PinnedScreen(), SettingScreen()]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndex.value,
                showSelectedLabels: true,
                selectedItemColor: Colors.black,
                onTap: controller.changePageIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_outlined),
                    label: "전체 공지",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star_outlined),
                    label: "중요 공지",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined), label: "설정"),
                ]))));
  }

  String _appBarTitle(int index) {
    if (index == 0) {
      return "전체 공지";
    } else if (index == 1) {
      return "중요 공지";
    } else {
      return "설정";
    }
  }
}
