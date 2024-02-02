import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
        ),
        GetPage(
          name: '/search',
          page: () => const SearchScreen(),
        ),
      ],
    );
  }
}
