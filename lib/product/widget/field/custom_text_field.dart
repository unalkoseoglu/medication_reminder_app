import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  CustomTextField(
      {Key? key,
      required String title,
      String? hint,
      TextEditingController? controller,
      Widget? child})
      : super(
          key: key,
          autofocus: false,
          readOnly: child == null ? false : true,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: child, labelText: title, hintText: hint),
        );
}
