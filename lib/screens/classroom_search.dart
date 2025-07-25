import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';

import '../cubit/all_classroom/all_classroom_cubit.dart';
import '../cubit/classroom/classroom_cubit.dart';
import '../injection_container.dart';
import '../utils/dimens.dart';
import '../widgets/bottom_sheet_join_class.dart';
import '../widgets/classroom_search/card.dart';

class ClassroomSearch extends StatelessWidget {
  const ClassroomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllClassroomCubit>(
          create: (context) => sl<AllClassroomCubit>()..fetchAllClassrooms(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: const Text('Search Classroom'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge, // Ensures ripple stays within rounded edges
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Programming 101'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // My Classes Section
              AllClassesSection(),
            ],
          ),
        ),
      ),
    );
  } 
}