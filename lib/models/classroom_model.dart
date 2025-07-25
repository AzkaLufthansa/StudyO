class ClassroomModel {
  final String id;
  final String teacherId;
  final String teacherName;
  final String className;
  // final int gradeId;
  final String gradeName;
  final String? password;
  final bool isPrivate;

  const ClassroomModel({
    required this.id,
    required this.teacherId,
    required this.teacherName,
    required this.className,
    // required this.gradeId,
    required this.gradeName,
    required this.password,
    required this.isPrivate
  });

  factory ClassroomModel.fromMap(Map<String, dynamic> map) {
    return ClassroomModel(
      id: map['id'], 
      teacherId: map['teacher_id'], 
      teacherName: map['users']?['full_name'] ?? '-', 
      className: map['name'], 
      // gradeId: map['grade'], 
      gradeName: map['grade']?['name'] ?? '-', 
      password: map['password'],
      isPrivate: map['is_private']
    );
  }
}