import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:school_meal_information/controller/main_controller.dart';
import 'package:school_meal_information/controller/school_controller.dart';
import 'package:school_meal_information/screens/main_screen.dart';
import 'package:school_meal_information/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(MainController());
            },
          ),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchScreen(),
          binding: BindingsBuilder(() {
            Get.put(SchoolController());
          }),
        ),
      ],
      initialRoute: '/',
    );
  }
}
