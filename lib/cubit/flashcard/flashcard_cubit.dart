import 'package:bloc/bloc.dart';
import 'package:study_o/services/flashcard_service.dart';

part 'flashcard_state.dart';

class FlashcardCubit extends Cubit<FlashcardState> {
  final FlashcardService flashcardService;

  FlashcardCubit({required this.flashcardService}) : super(FlashcardInitial());

  Future<void> generateFlashcards(String title, String description, String materialId) async {
    emit(FlashcardLoading());
    try {
      final flashcards = await flashcardService.generateFlashcard(title, description, materialId);
      emit(FlashcardSuccess(flashcards));
    } catch (e) {
      emit(FlashcardError(e.toString()));
    }
  }
}
