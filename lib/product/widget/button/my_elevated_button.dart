import 'package:flutter/material.dart';

class MyElevatedButton extends ElevatedButton {
  MyElevatedButton(
      {required super.onPressed,
      required Widget? child,
      bool isIcon = false,
      EdgeInsets? padding})
      : super(
          child: child,
          style: ElevatedButton.styleFrom(
              onPrimary: isIcon ? Colors.green : Colors.white,
              elevation: 0,
              primary: isIcon ? Colors.white : Colors.green,
              padding: padding ??
                  EdgeInsets.symmetric(
                      vertical: isIcon ? 10 : 15, horizontal: isIcon ? 15 : 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
        );
}
