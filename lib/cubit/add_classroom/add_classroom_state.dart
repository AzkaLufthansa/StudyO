part of 'add_classroom_cubit.dart';

abstract class AddClassroomState {
  final String? materialId;
  final String? errorMessage;

  const AddClassroomState({
    this.materialId,
    this.errorMessage,
  });
}

class AddClassroomInitial extends AddClassroomState {}

class AddClassroomLoading extends AddClassroomState {}

class AddClassroomSuccess extends AddClassroomState {
  // final String materialId;

  // AddClassroomSuccess({required this.materialId}) : super(materialId: materialId);
}

class AddClassroomFailure extends AddClassroomState {
  final String errorMessage;

  const AddClassroomFailure({required this.errorMessage}) : super(errorMessage: errorMessage);
}
