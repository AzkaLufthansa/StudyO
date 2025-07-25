// flashcard_list_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_o/services/flashcard_service.dart';
import '../../models/flashcard_model.dart';


part 'get_flashcard_state.dart';

class FlashcardListCubit extends Cubit<FlashcardListState> {
  final FlashcardService service;

  FlashcardListCubit({required this.service}) : super(FlashcardListInitial());

  Future<void> fetchFlashcards() async {
    emit(FlashcardListLoading());
    try {
      final result = await service.getAllFlashcards();
      emit(FlashcardListSuccess(result));
    } catch (e) {
      emit(FlashcardListFailure(e.toString()));
    }
  }
}
