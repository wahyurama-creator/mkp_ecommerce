import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType inputType;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 13,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 15, color: Colors.grey.shade800),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill the text field';
        }
        return null;
      },
      keyboardType: inputType,
    );
  }
}
