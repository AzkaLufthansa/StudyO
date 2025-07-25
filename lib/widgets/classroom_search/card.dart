import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_o/cubit/classroom/classroom_cubit.dart';
import 'package:study_o/utils/app_colors.dart';

import '../../cubit/all_classroom/all_classroom_cubit.dart';
import '../../utils/dimens.dart';

class AllClassesSection extends StatelessWidget {
  const AllClassesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(AppDimens.marginPaddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Title
            Text(
              'Join Public Classrooms:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: AppDimens.marginPaddingMedium),

            BlocBuilder<AllClassroomCubit, AllClassroomState>(
              builder: (context, state) {
                if (state is AllClassroomLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AllClassroomFailure) {
                  return Center(child: Text('Error: ${state.errMessage}'));
                } else if (state is AllClassroomSuccess) {
                  final classrooms = state.allClassrooms;

                  if (classrooms.isEmpty) {
                    return const Center(child: Text('No classrooms found.'));
                  }

                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: classrooms.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final classroom = classrooms[index];

                      return Material(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(
                          AppDimens.radiusLarge,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/classroom_dashboard', arguments: {
                              'classroomId': classroom.id,
                              'classroomTitle': classroom.className
                            });
                          },
                          splashColor: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              AppDimens.marginPaddingMedium,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  classroom.className,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Grade ${classroom.gradeName}'),
                                const SizedBox(height: AppDimens.marginPaddingExtraLarge),
                                Text(classroom.teacherName),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: AppDimens.marginPaddingMedium,
                      );
                    },
                  );
                }

                return const SizedBox(); // Initial state
              },
            ),

            const SizedBox(height: AppDimens.marginPaddingMedium),
          ],
        ),
      ),
    );
  }
}
