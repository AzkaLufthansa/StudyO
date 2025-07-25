import 'package:study_o/models/grade_model.dart';

abstract class GradeState {
  final List<GradeModel>? grades;
  final String? errMessage;

  const GradeState({
    this.grades,
    this.errMessage,
  });
}

class GradeInitial extends GradeState {}

class GradeLoading extends GradeState {}

class GradeSuccess extends GradeState {
  final List<GradeModel> grades;

  const GradeSuccess({required this.grades})
      : super(grades: grades);
}

class GradeFailure extends GradeState {
  final String errMessage;

  const GradeFailure({required this.errMessage})
      : super(errMessage: errMessage);
}
