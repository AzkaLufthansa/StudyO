import 'package:get/get.dart';
import 'package:study_o/screens/classroom_dashboard.dart';
import 'package:study_o/screens/add_material_page.dart';
import 'package:study_o/screens/classroom_search.dart';
import 'package:study_o/screens/flashcard_page.dart';
import 'package:study_o/screens/login_page.dart';
import 'package:study_o/screens/material.dart';
import 'package:study_o/screens/quiz_room.dart';
import 'package:study_o/screens/tutorial.dart';

import '../screens/classroom.dart';
import '../screens/home_page.dart';
import '../screens/profile_page.dart';
import '../screens/quiz.dart';

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
    GetPage(name: '/classroom_dashboard', page: () => ClassroomDashboard()),
    GetPage(name: '/classroom', page: () => Classroom()),
    GetPage(name: '/add_material', page: () => AddMaterialPage()),
    GetPage(name: '/classroom_search', page: () => ClassroomSearch()),
    GetPage(name: '/material', page: () => Material()),
    GetPage(name: '/quiz', page: () => Quiz()),
    GetPage(name: '/quiz_room', page: () => QuizRoom()),
    GetPage(name: '/tutorial', page: () => Tutorial()),
    GetPage(name: '/flashcard', page: () => FlashcardPage()),
  ];
}