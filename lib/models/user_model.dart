class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? avatarUrl;

  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.avatarUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      avatarUrl: map['avatar_url'],
    );
  }
}
