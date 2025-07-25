part of 'all_classroom_cubit.dart';

abstract class AllClassroomState {
  final List<ClassroomModel>? allClassrooms;
  final String? errMessage;

  const AllClassroomState({
    this.allClassrooms,
    this.errMessage,
  });
}

class AllClassroomInitial extends AllClassroomState {}

class AllClassroomLoading extends AllClassroomState {}

class AllClassroomSuccess extends AllClassroomState {
  final List<ClassroomModel> allClassrooms;

  const AllClassroomSuccess({required this.allClassrooms})
      : super(allClassrooms: allClassrooms);
}

class AllClassroomFailure extends AllClassroomState {
  final String errMessage;

  const AllClassroomFailure({required this.errMessage})
      : super(errMessage: errMessage);
}
