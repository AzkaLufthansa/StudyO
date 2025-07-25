import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/cubit/classroom/classroom_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';
import 'package:study_o/widgets/bottom_sheet_join_class.dart';

import '../widgets/home/my_classes_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClassroomCubit>(
          create: (context) => sl<ClassroomCubit>()..fetchMyClassrooms(),
        ),
      ],
      child: Scaffold(
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
          backgroundColor: const Color.fromARGB(255, 105, 1, 114),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}