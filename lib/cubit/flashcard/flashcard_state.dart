part of 'flashcard_cubit.dart';

abstract class FlashcardState {
  const FlashcardState();
}

class FlashcardInitial extends FlashcardState {}

class FlashcardLoading extends FlashcardState {}

class FlashcardSuccess extends FlashcardState {
  final List<Map<String, String>> flashcards;

  const FlashcardSuccess(this.flashcards);
}

class FlashcardError extends FlashcardState {
  final String message;

  const FlashcardError(this.message);
}
