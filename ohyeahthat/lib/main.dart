import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ohyeahthat/pages/keywordpage.dart';
import 'package:ohyeahthat/screen/login.dart';
import 'package:ohyeahthat/screen/home.dart';
import 'binding/init_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1125, 2436),
      builder: () => GetMaterialApp(
        title: 'ohyeathat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(           
          primaryColor: Colors.blue,
          backgroundColor: Colors.white,
        ),
        home: const LoginScreen(),
        initialBinding: InitBinding(),
        getPages: [
          GetPage(
            name: '/login',
            page: () => const LoginScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: '/keyword',
            page: () => const KeyWord(),
          )
        ]
      ),
    );
  }
}