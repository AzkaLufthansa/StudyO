part of 'classroom_cubit.dart';

abstract class ClassroomState {
  final List<ClassroomModel>? classrooms;
  final String? errMessage;

  const ClassroomState({
    this.classrooms,
    this.errMessage,
  });
}

class ClassroomInitial extends ClassroomState {}

class ClassroomLoading extends ClassroomState {}

class ClassroomSuccess extends ClassroomState {
  final List<ClassroomModel> classrooms;

  const ClassroomSuccess({required this.classrooms})
      : super(classrooms: classrooms);
}

class ClassroomFailure extends ClassroomState {
  final String errMessage;

  const ClassroomFailure({required this.errMessage})
      : super(errMessage: errMessage);
}
