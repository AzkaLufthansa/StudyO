import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/models/classroom_model.dart';
import 'package:study_o/services/classroom_service.dart';

part 'classroom_state.dart';

class ClassroomCubit extends Cubit<ClassroomState> {
  final ClassroomService classroomService;

  ClassroomCubit({required this.classroomService}) : super(ClassroomInitial());

  Future<void> fetchMyClassrooms() async {
    emit(ClassroomLoading());

    try {
      final classrooms = await classroomService.getAllMyClassrooms();
      emit(ClassroomSuccess(classrooms: classrooms));
    } catch (e) {
      emit(ClassroomFailure(errMessage: e.toString()));
    }
  }
}
