// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/models/material_model.dart';

import '../../services/classroom_service.dart';

part 'material_state.dart';

class MaterialCubit extends Cubit<MaterialState> {
  final ClassroomService MaterialService;

  MaterialCubit({required this.MaterialService}) : super(MaterialInitial());

  Future<void> fetchMyMaterials({
    required String classroomId
  }) async {
    emit(MaterialLoading());

    try {
      final Materials = await MaterialService.getAllClassroomMaterials(classroomId);
      emit(MaterialSuccess(material: Materials));
    } catch (e) {
      emit(MaterialFailure(errMessage: e.toString()));
    }
  }
}
