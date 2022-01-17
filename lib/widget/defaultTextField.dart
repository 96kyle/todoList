import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool obscureText;
  DefaultTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
}
