import 'package:bloc/bloc.dart';

import '../../models/post_material_request_model.dart';
import '../../services/material_service.dart';

part 'post_material_state.dart';

class PostMaterialCubit extends Cubit<PostMaterialState> {
  final MaterialService materialService;
      
  PostMaterialCubit({required this.materialService}) : super(PostMaterialInitial());

  Future<void> fetchPostMaterials(PostMaterialRequestModel request) async {
    emit(PostMaterialLoading());

    try {
      final result = await materialService.postMaterial(request);
      emit(PostMaterialSuccess(materialId: result));
    } catch (e) {
      emit(PostMaterialFailure(e.toString()));
    }
  }
}
