class MaterialModel {
  final String id;
  final String title;
  final String content;
  final String classroomId;

  const MaterialModel({
    required this.id,
    required this.title,
    required this.content,
    required this.classroomId,
  });

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['id'], 
      title: map['title'], 
      content: map['content'], 
      classroomId: map['classroom_id']
    );
  }
}