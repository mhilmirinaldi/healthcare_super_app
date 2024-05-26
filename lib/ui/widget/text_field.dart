import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: textColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: greyColor)),
        ));
  }
}
