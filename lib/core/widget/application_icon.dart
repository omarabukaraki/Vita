import 'package:flutter/material.dart';
import 'package:vitafit/core/app_color.dart';

class ApplicationIcon extends StatelessWidget {
  const ApplicationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.kPrimary,
      ),
      child: const Center(
          child: Text(
        'Application Icon',
        style: TextStyle(color: Colors.white, fontSize: 26),
      )),
    );
  }
}
