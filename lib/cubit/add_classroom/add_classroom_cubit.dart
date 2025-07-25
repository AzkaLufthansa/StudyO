import 'package:bloc/bloc.dart';
import 'package:study_o/models/classroom_request_model.dart';
import 'package:study_o/services/add_classroom_service.dart';

part 'add_classroom_state.dart';

class AddClassroomCubit extends Cubit<AddClassroomState> {
  final AddClassroomService service;
      
  AddClassroomCubit({required this.service}) : super(AddClassroomInitial());

  Future<void> fetchAddClassrooms(AddClassroomRequestModel request) async {
    emit(AddClassroomLoading());

    try {
      await service.postAddPrivateClassrooms(request);
      emit(AddClassroomSuccess());
    } catch (e) {
      emit(AddClassroomFailure(errorMessage: e.toString()));
    }
  }
}
