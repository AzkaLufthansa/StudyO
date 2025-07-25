class AddClassroomRequestModel {
  final String name;
  final int gradeId;
  final bool isPrivate;

  const AddClassroomRequestModel({
    required this.name,
    required this.gradeId,
    required this.isPrivate,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'grade': gradeId,
      'is_private': isPrivate,
    };
  }
}