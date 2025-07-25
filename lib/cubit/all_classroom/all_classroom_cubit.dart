import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/models/classroom_model.dart';
import '../../services/all_classroom_service.dart';

part 'all_classroom_state.dart';

class AllClassroomCubit extends Cubit<AllClassroomState> {
  final AllClassroomService allClassroomService;

  AllClassroomCubit({required this.allClassroomService}) : super(AllClassroomInitial());

  Future<void> fetchAllClassrooms() async {
    emit(AllClassroomLoading());

    try {
      final allClassrooms = await allClassroomService.getAllPublicClassrooms();
      emit(AllClassroomSuccess(allClassrooms: allClassrooms));
    } catch (e) {
      emit(AllClassroomFailure(errMessage: e.toString()));
    }
  }
}
