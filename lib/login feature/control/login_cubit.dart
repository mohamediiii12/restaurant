import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2)); // simulate api
    if (email == "test@test.com" && password == "123456") {
      emit(LoginSuccess());
    } else {
      emit(LoginError("Invalid credentials"));
    }
  }
}
