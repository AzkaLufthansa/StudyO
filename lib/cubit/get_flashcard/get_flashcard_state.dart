// flashcard_list_state.dart

part of 'get_flashcard_cubit.dart';

abstract class FlashcardListState {
  const FlashcardListState();

  @override
  List<Object> get props => [];
}

class FlashcardListInitial extends FlashcardListState {}

class FlashcardListLoading extends FlashcardListState {}

class FlashcardListSuccess extends FlashcardListState {
  final List<FlashcardModel> flashcards;

  const FlashcardListSuccess(this.flashcards);

  @override
  List<Object> get props => [flashcards];
}

class FlashcardListFailure extends FlashcardListState {
  final String message;

  const FlashcardListFailure(this.message);

  @override
  List<Object> get props => [message];
}
