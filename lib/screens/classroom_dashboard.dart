import 'package:flutter/material.dart' hide MaterialState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_o/cubit/classroom/classroom_cubit.dart';
import 'package:study_o/cubit/classroom_user/classroom_user_cubit.dart';
import 'package:study_o/cubit/material/material_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/models/classroom_model.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';

// import '../injection_container.dart';

class ClassroomDashboard extends StatefulWidget {
  const ClassroomDashboard({super.key});

  @override
  State<ClassroomDashboard> createState() => _ClassroomDashboardState();
}

class _ClassroomDashboardState extends State<ClassroomDashboard> {
  late String classroomTitle;
  late String classroomId;

  @override
  void initState() {
    super.initState();
    classroomTitle = Get.arguments['classroomTitle'];
    classroomId = Get.arguments['classroomId'];
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // TODO:
        BlocProvider<ClassroomUserCubit>(
          create: (_) => sl<ClassroomUserCubit>()..fetchClassroomUsers(classroomId)
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: const Text('Classroom Dashboard'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
          child: ClassMaterialCard(title: classroomTitle, classroomId: classroomId,)
        ),
      ),
    );
  }
}

class ClassMaterialCard extends StatelessWidget {
  final String title;
  final String classroomId;

  const ClassMaterialCard({super.key, required this.title, required this.classroomId});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(AppDimens.marginPaddingMedium),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimens.marginPaddingMedium,),
            Container(
              width: double.infinity,
              child: Material(
                color: const Color.fromARGB(255, 14, 0, 18),
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/material', arguments: classroomId);  
                  },
                  splashColor: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                    child: Text('Learn', textAlign: TextAlign.center,),
                    ),
                ),
              )
            ),
            const SizedBox(height: AppDimens.marginPaddingSmallXX,),
            Container(
              width: double.infinity,
              child: Material(
                color: const Color.fromARGB(255, 14, 0, 18),
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/quiz');  
                  },
                  splashColor: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                    child: Text('Quiz', textAlign: TextAlign.center,),
                    ),
                ),
              )
            ),
            const SizedBox(height: AppDimens.marginPaddingSmallXX,),
            SizedBox(
              width: double.infinity,
              child: Material(
                color: const Color.fromARGB(255, 14, 0, 18),
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/flashcard');  
                  },
                  splashColor: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                    child: Text('Flashcard', textAlign: TextAlign.center,),
                    ),
                ),
              )
            ),
            const SizedBox(height: AppDimens.marginPaddingSmall,),
            Card(
              color: const Color.fromARGB(255, 14, 0, 18),
              child: Container(
                padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Who's in this classroom", textAlign: TextAlign.center,),
                    const SizedBox(height: 8),
                    BlocBuilder<ClassroomUserCubit, ClassroomUserState>(
                      builder: (context, state) {
                        if (state is ClassroomUserFailure) {
                          return Center(child: Text('Error: ${state.errorMessage}'));
                        } else if (state is ClassroomUserSuccess) {
                          return ListView.separated(
                            itemBuilder: (_, index) {
                              return ClassroomUserWidget(data: state.users[index],);
                            }, 
                            separatorBuilder: (_, __) {
                              return const SizedBox(height: 0,);
                            }, 
                            itemCount: state.users.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          );
                        } else {
                          return const Center(child: const CircularProgressIndicator(),);
                        }
                      },
                    ),
                    ]
                  )
                )
              ),
          ],
        ),
      ),
    );
  }
}

class ClassroomUserWidget extends StatelessWidget {
  final UserJoinedModel data;

  const ClassroomUserWidget({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 2, 4, 52),
      child: Container(
        padding: EdgeInsets.all(AppDimens.marginPaddingSmall),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                data.name,
                overflow: TextOverflow.clip,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 6, 9, 117)
                ), // optional background)
              child: Text(
                'Teacher',
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      )
    );
  }
}