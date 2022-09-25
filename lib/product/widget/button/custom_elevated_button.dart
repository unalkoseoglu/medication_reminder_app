import 'package:flutter/material.dart';

class MyElevatedButton extends ElevatedButton {
  MyElevatedButton(
      {Key? key,
      required super.onPressed,
      required Widget? child,
      Color? color})
      : super(
            key: key,
            child: child,
            style: ElevatedButton.styleFrom(primary: color));
}
