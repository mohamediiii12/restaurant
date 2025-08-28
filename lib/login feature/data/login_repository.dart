import 'user_model.dart';

class LoginRepository {

  Future<UserModel> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 900));
    if (email == 'test@test.com' && password == '123456') {
      return UserModel.fromJson({
        'id': 1,
        'name': 'Mohamed',
        'email': email,
        'token': 'token_123',
      });
    }
    throw Exception('The email or password is not correct');
  }
}
