import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../control/login_cubit.dart';
import '../control/login_state.dart';
import '../data/login_repository.dart';
import 'widgets/app_button.dart';
import 'widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool showPass = false;
  bool remember = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(LoginRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Log in')),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is LoginSuccess) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                },
                builder: (context, state) {
                  final loading = state is LoginLoading;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),
                      const Text('أهلًا بيك 👋',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text(
                          'Register your entry to an eating request quickly',
                          style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 24),
                      AppTextField(
                          controller: email,
                          label: 'e-mail',
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 12),
                      TextField(
                        controller: pass,
                        obscureText: !showPass,
                        decoration: InputDecoration(
                          labelText: 'password',
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => showPass = !showPass),
                            icon: Icon(showPass
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Switch(
                              value: remember,
                              onChanged: (v) => setState(() => remember = v)),
                          const Text('Remind me'),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: const Text('I forgot the password?')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        text: loading ? 'Entry ...' : 'Log in',
                        onPressed: loading
                            ? null
                            : () => context
                                .read<LoginCubit>()
                                .login(email.text.trim(), pass.text.trim()),
                      ),
                      const SizedBox(height: 16),
                      const Center(child: Text('Or continued as a visitor ')),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: loading
                            ? null
                            : () => Navigator.of(context)
                                .pushReplacementNamed('/home'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text('Browse restaurants'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
