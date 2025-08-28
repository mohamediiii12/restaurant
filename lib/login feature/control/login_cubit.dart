import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/login feature/data/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;
  LoginCubit(this.repo) : super(const LoginInitial());

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginFailure('Please enter mail and password'));
      return;
    }
    emit(const LoginLoading());
    try {
      final user = await repo.login(email: email, password: password);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
