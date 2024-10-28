import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String label;
  final bool? isPassword;
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var showPassword = false;
  makePasswordVisible() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPassword,
      decoration: InputDecoration(
          suffix: widget.isPassword == false
              ? null
              : Icon(showPassword == true
                      ? Icons.visibility_off
                      : Icons.visibility)
                  .onTap(() {
                  makePasswordVisible();
                }),
          hintText: widget.hint,
          labelText: widget.label,
          border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
