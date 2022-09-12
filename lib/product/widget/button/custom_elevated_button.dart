import 'package:flutter/material.dart';

class MyElevatedButton extends ElevatedButton {
  MyElevatedButton(
      {required super.onPressed,
      required Widget? child,
      bool isIcon = false,
      EdgeInsets? padding,
      bool isCircle = false,
      Color? color})
      : super(
          child: child,
          style: ElevatedButton.styleFrom(
              onPrimary: isIcon ? Colors.green : Colors.white,
              elevation: 0,
              primary: color ?? (isIcon ? Colors.white : Colors.green),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              shape: isCircle
                  ? const CircleBorder()
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
        );
}
