import 'package:flutter/material.dart';
import 'package:vitafit/core/app_color.dart';

class SignAndLoginButton extends StatelessWidget {
  const SignAndLoginButton(
      {super.key, this.question, this.pageName, this.onTap});

  final String? question;
  final String? pageName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question ?? "Don't have an Account?",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              pageName ?? ' Sign Up',
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColor.kPrimary,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
