import 'package:client_dart_project/app/ui/components/app_text_button.dart';
import 'package:client_dart_project/app/ui/components/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

   final controllerLogin = TextEditingController();
   final controllerPassword = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoginScreen"),),
      body: Form (
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
                const SizedBox(height: 16,),
                AppTextField(
                  controller: controllerPassword,
                  labelText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 16,),
                 AppTextButton(
                    onPressed: ()  {
                      if (formKey.currentState?.validate() == true) {
                        print("Ok");
                      }
                    },
                   text: "Log In",
                ),
                const SizedBox(height: 16,),
                AppTextButton(
                  onPressed: ()  {
                    if (formKey.currentState?.validate() == true) {
                      print("Ok");
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


}
