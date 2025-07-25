class GradeModel {
  final String id;
  final String gradeName;

  const GradeModel({
    required this.id,
    required this.gradeName
  });

  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['id'], 
      gradeName: map['name'], 
    );
  }
}