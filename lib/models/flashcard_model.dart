class FlashcardModel {
  final String id;
  final String front;
  final String back;

  const FlashcardModel({
    required this.id,
    required this.front,
    required this.back,
  });

  factory FlashcardModel.fromMap(Map<String, dynamic> map) {
    return FlashcardModel(
      id: map['id'], 
      front: map['front'], 
      back: map['back']
    );
  }
}