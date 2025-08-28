class UserModel {
  final String id;
  final String name;
  final String email;
  final String token;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> j) => UserModel(
        id: j['id'].toString(),
        name: j['name'] ?? '',
        email: j['email'] ?? '',
        token: j['token'] ?? '',
      );
}
