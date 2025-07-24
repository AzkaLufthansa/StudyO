import 'package:flutter/material.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';
import 'package:study_o/widgets/bottom_sheet_join_class.dart';

import '../widgets/home/my_classes_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            MyClassesSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            builder: (_) {
              return BottomSheetJoinClass();
            }
          );
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 105, 1, 114),
      ),
    );
  }
}