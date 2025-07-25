import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/services/grade_service.dart';

import 'grade_state.dart';

class GradeCubit extends Cubit<GradeState> {
  final GradeService gradeService;

  GradeCubit({required this.gradeService}) : super(GradeInitial());

  Future<void> fetchMyGrades() async {
    emit(GradeLoading());

    try {
      final grades = await gradeService.getAllMyGrades();
      emit(GradeSuccess(grades: grades));
    } catch (e) {
      emit(GradeFailure(errMessage: e.toString()));
    }
  }
}
