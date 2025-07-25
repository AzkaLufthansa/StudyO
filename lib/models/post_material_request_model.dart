class PostMaterialRequestModel {
  final String title;
  final String content;
  final String classroomId;

  const PostMaterialRequestModel({
    required this.title,
    required this.content,
    required this.classroomId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'classroom_id': classroomId
    };
  }
}