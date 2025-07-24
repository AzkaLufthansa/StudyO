import 'package:get/get.dart';
import 'package:study_o/screens/login_screen.dart';

import '../screens/home_page.dart';
import '../screens/profile_page.dart';

class AppRoutes {
  static List<GetPage> get pageRoute => [
    GetPage(
      name: '/login', 
      page: () => LoginPage()
    ),
    GetPage(
      name: '/home', 
      page: () => HomePage()
    ),
    GetPage(
      name: '/profile', 
      page: () => ProfilePage()
    ),
  ];
}