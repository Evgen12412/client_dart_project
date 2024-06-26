import 'package:client_dart_project/app/ui/components/app_text_button.dart';
import 'package:client_dart_project/app/ui/components/app_text_field.dart';
import 'package:client_dart_project/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:client_dart_project/feature/auth/ui/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginScreen"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: controllerLogin,
                  labelText: "Log In",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextField(
                  controller: controllerPassword,
                  labelText: "Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      _onTapToSignIn(context.read<AuthCubit>());
                    }
                  },
                  text: "Log In",
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen()
                    ));
                  },
                  text: "Register",
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapToSignIn(AuthCubit authCubit) => authCubit.signIn(
      username: controllerLogin.text, password: controllerPassword.text);
}
