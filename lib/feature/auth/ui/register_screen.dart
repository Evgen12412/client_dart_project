import 'package:client_dart_project/app/ui/components/app_text_button.dart';
import 'package:client_dart_project/app/ui/components/app_text_field.dart';
import 'package:client_dart_project/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RegisterScreen"),
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
                  controller: controllerEmail,
                  labelText: "Email",
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
                AppTextField(
                  controller: controllerConfirmPassword,
                  labelText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      if (controllerPassword.text !=
                          controllerConfirmPassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Password not true")));
                      } else {
                        _onTapToSignUp(context.read<AuthCubit>());
                        Navigator.of(context).pop();
                      }
                    }
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

  void _onTapToSignUp(AuthCubit authCubit) => authCubit.signUp(
      username: controllerLogin.text,
      email: controllerEmail.text,
      password: controllerPassword.text);
}
