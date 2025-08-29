import 'user_model.dart';

class LoginRepository {
  Future<UserModel?> login(String email, String password) async {
    // mock login
    await Future.delayed(const Duration(seconds: 1));
    if (email == "test@test.com" && password == "123456") {
      return UserModel(id: "1", email: email);
    }
    return null;
  }
}
