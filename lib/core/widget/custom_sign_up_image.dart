import 'package:flutter/material.dart';
import 'package:vitafit/core/app_color.dart';

class CustomSignUpImage extends StatelessWidget {
  const CustomSignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: CircleAvatar(
        backgroundColor: AppColor.kPrimary,
        radius: 60,
        child: Center(child: Text('Image')),
      ),
    );
  }
}
