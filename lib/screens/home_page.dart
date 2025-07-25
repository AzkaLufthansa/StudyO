import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/cubit/classroom/classroom_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';
import 'package:study_o/widgets/bottom_sheet_join_class.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/home/my_classes_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _refreshController = RefreshController();

  final ClassroomCubit _classroomCubit = sl<ClassroomCubit>();

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClassroomCubit>(
          create: (context) => _classroomCubit..fetchMyClassrooms(),
        ),
      ],
      child: _content(context),
    );
  }

  Scaffold _content(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Studyo'),
        centerTitle: true,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
        _classroomCubit.fetchMyClassrooms();
          
          _refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
          child: Column(
            children: [
              // My Classes Section
              MyClassesSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<ClassroomCubit, ClassroomState>(
        builder: (_, __) {
          return FloatingActionButton(
            onPressed: () async {
              var result = await showModalBottomSheet(
                context: context, 
                builder: (_) {
                  return BottomSheetJoinClass();
                }
              );
          
              if (result == true) {
                BlocProvider.of<ClassroomCubit>(context).fetchMyClassrooms();
              }
            },
            backgroundColor: const Color.fromARGB(255, 105, 1, 114),
            child: Icon(Icons.add),
          );
        }
      ),
    );
  }
}