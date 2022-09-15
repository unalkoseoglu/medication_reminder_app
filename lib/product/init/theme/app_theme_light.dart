import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';
import 'app_theme.dart';

import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with LightThemeInterface {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      scaffoldBackgroundColor: colorSchemeLight!.washMe,
      colorScheme: _appColorScheme,
      cardTheme: cardTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      floatingActionButtonTheme: floatingActionButtonTheme);

  ColorScheme get _appColorScheme => ColorScheme(
        brightness: colorSchemeLight!.brightnessLight,
        primary: colorSchemeLight!.ultraRed,
        onPrimary: colorSchemeLight!.blackMetal,
        secondary: colorSchemeLight!.newBuryPort,
        onSecondary: colorSchemeLight!.blackMetal,
        error: colorSchemeLight!.alarm,
        onError: colorSchemeLight!.washMe,
        background: colorSchemeLight!.razee,
        onBackground: colorSchemeLight!.yankeesBlue,
        surface: colorSchemeLight!.washMe,
        onSurface: colorSchemeLight!.cherenkovRadiation,
      );

  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        foregroundColor: colorSchemeLight!.cloudBreak,
        backgroundColor: colorSchemeLight!.jamaicanJade,
        iconSize: 35.h,
      );
  AppBarTheme get appBarTheme => AppBarTheme(
      systemOverlayStyle: colorSchemeLight!.systemUiOverlayStyle,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: colorSchemeLight!.alarm,
      titleTextStyle: TextStyle(color: colorSchemeLight!.blackMetal),
      iconTheme: IconThemeData(color: colorSchemeLight!.blackMetal),
      actionsIconTheme: IconThemeData(color: colorSchemeLight!.blackMetal),
      centerTitle: false);

  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 30.h),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedIconTheme: IconThemeData(size: 25.h),
          unselectedItemColor: colorSchemeLight!.heartFelt);

  CardTheme get cardTheme => CardTheme(
        color: colorSchemeLight!.washMe,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      );
  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: colorSchemeLight!.jamaicanJade,
          elevation: 1,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          onPrimary: colorSchemeLight!.washMe));
}







/* import 'package:flutter/material.dart';
import 'package:medication_reminder_app/product/init/theme/light/light_theme_interface.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme with LightThemeInterface {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light();

  ColorScheme get _appColorScheme => ColorScheme(
      brightness: colorSchemeLight!.brightnessLight,
      primary: colorSchemeLight!.white,
      onPrimary: colorSchemeLight!.blueFlag,
      secondary: colorSchemeLight!.newBuryPort,
      onSecondary: colorSchemeLight!.blackMetal,
      error: colorSchemeLight!.alarm,
      onError: colorSchemeLight!.white,
      background: colorSchemeLight!.razee,
      onBackground: colorSchemeLight!.yankeesBlue,
      surface: colorSchemeLight!.white,
      onSurface: colorSchemeLight!.cherenkovRadiation);
} */
