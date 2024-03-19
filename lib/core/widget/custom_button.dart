import 'package:flutter/material.dart';
import 'package:vitafit/core/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.labelBtn, this.onTap});
  final String? labelBtn;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: AppColor.kPrimary),
        child: Center(
            child: Text(
          labelBtn ?? 'Login',
          style: const TextStyle(color: Colors.white, fontSize: 26),
        )),
      ),
    );
  }
}
