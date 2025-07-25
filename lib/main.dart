import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/routes/routes.dart';
import 'package:study_o/screens/login_page.dart';
import 'package:study_o/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_URL
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StudyO',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: 'MiSans',
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.dark,
      
      home: LoginPage(),
      getPages: AppRoutes.pageRoute,
    );
  }
}


