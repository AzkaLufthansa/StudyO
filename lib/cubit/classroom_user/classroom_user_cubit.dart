import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/classroom_model.dart';
import '../../services/classroom_service.dart';

part 'classroom_user_state.dart';

class ClassroomUserCubit extends Cubit<ClassroomUserState> {
  final ClassroomService classroomService;
      
  ClassroomUserCubit({required this.classroomService}) : super(ClassroomUserInitial());

  Future<void> fetchClassroomUsers(String classroomId) async {
    emit(ClassroomUserLoading());

    try {
      final users = await classroomService.getClassroomJoinedUsers(classroomId);
      emit(ClassroomUserSuccess(users));
    } catch (e) {
      emit(ClassroomUserFailure(e.toString()));
    }
  }
}
