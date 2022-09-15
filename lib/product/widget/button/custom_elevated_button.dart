import 'package:flutter/material.dart';

class MyElevatedButton extends ElevatedButton {
  MyElevatedButton(
      {required super.onPressed, required Widget? child, Color? color})
      : super(child: child, style: ElevatedButton.styleFrom(primary: color));
}
