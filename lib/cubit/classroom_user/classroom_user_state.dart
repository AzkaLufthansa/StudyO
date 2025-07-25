part of 'classroom_user_cubit.dart';

abstract class ClassroomUserState {
  final List<UserJoinedModel>? users;
  final String? errorMessage;

  const ClassroomUserState({
    this.users,
    this.errorMessage,
  });
}

class ClassroomUserInitial extends ClassroomUserState {}

class ClassroomUserLoading extends ClassroomUserState {}

class ClassroomUserSuccess extends ClassroomUserState {
  final List<UserJoinedModel> users;

  const ClassroomUserSuccess(this.users) : super(users: users);
}

class ClassroomUserFailure extends ClassroomUserState {
  final String errorMessage;

  const ClassroomUserFailure(this.errorMessage) : super(errorMessage: errorMessage);
}
