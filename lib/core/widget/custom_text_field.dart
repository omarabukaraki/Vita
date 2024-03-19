import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.text, this.onChanged, this.icon, this.isPassword});
  final String? text;
  final void Function(String)? onChanged;
  final IconData? icon;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
          obscureText: isPassword ?? false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: Icon(icon ?? Icons.email),
              hintText: text ?? 'Email',
              border: const OutlineInputBorder())),
    );
  }
}
