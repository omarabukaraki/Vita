import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:vitafit/app_authentication.dart';
import 'package:vitafit/sign_up_page.dart';
import 'core/widget/application_icon.dart';
import 'core/widget/custom_button.dart';
import 'core/widget/custom_text_field.dart';
import 'core/widget/sign_and_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                const ApplicationIcon(),
                CustomTextField(
                  controller: email,
                  text: 'Email',
                  onChanged: (userEmail) {
                    email.text = userEmail;
                  },
                ),
                CustomTextField(
                  controller: password,
                  isPassword: true,
                  icon: Icons.lock,
                  text: 'Password',
                  onChanged: (userPassword) {
                    password.text = userPassword;
                  },
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await AppAuthentication().loginUser(
                          email: email.text,
                          password: password.text,
                          context: context);
                      email.clear();
                      password.clear();
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
                SignAndLoginButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
