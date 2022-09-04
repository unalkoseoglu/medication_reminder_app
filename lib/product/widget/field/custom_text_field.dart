import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, this.controller, required this.title, this.hint, this.child})
      : super(key: key);
  final TextEditingController? controller;
  final String title;
  final String? hint;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: false,
        readOnly: child == null ? false : true,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: child, labelText: title, hintText: hint),
      ),
    );
  }
}
