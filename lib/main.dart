import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/routes/routes.dart';
import 'package:study_o/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StudyO',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
      getPages: AppRoutes.pageRoute,
    );
  }
}


