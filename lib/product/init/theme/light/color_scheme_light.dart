import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();

  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle.light;

  final Color baingani = const Color(0xff8676fd);
  final Color cherenkovRadiation = const Color(0xff1dbef9);
  final Color whippedApricot = const Color(0xffffd099);
  final Color tangerineTango = const Color(0xfffe9b4b);
  final Color razee = const Color(0xff7395cf);

  final Color alarm = const Color(0xfff00505);
  final Color heartFelt = const Color(0xffffafc6);
  final Color ultraRed = const Color(0xffff6c87);

  final Color jamaicanJade = const Color(0xff62dbc6);
  final Color stampPadGreen = const Color(0xff48bba6);

  final Color washMe = const Color(0xfffaf9fe);
  final Color cloudBreak = const Color(0xffedf1f2);

  final Color blackMetal = const Color(0xff000000);

  final Color blueFlag = const Color(0xff3c5073);
  final Color newBuryPort = const Color(0xff45597a);
  final Color yankeesBlue = const Color(0xff1e2843);
}
