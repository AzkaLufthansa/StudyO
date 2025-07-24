import 'package:flutter/material.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

import '../widgets/home/my_classes_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Studyo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
        child: Column(
          children: [
            // My Classes Section
            Container(
              child: MyClassesSection(),
            ),
            ElevatedButton(
              onPressed: () {
              Get.toNamed('/classroom_dashboard');
            }, child: Text("Classroom dashboard"))
          ],
        ),
      ),
    );
  }
}