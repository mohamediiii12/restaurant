class UserModel {
  final String userEmail;
  final String usercode;

  UserModel({required this.userEmail, required this.usercode});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userEmail: json['userEmail'],
      usercode: json['usercode'],
    );
  }
}