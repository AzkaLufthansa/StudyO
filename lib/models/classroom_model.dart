import 'package:study_o/models/user_model.dart';

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
    required this.isPrivate,
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
      isPrivate: map['is_private'],
    );
  }
}

class UserJoinedModel {
  final String name;
  final double point;
  final bool isTeacher;

  const UserJoinedModel({
    required this.name,
    required this.point,
    required this.isTeacher,
  });

  factory UserJoinedModel.fromMap(Map<String, dynamic> map, String classroomTeacherId) {
    final user = map['users'];
    return UserJoinedModel(
      name: user['full_name'] ?? 'Unknown',
      point: user['score'] != null ? (user['score'] as num).toDouble() : 0.0,
      isTeacher: classroomTeacherId == user['id'],
    );
  }

}