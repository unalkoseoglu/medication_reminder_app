import 'package:flutter/material.dart';
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
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: colorSchemeLight!.washMe,
      colorScheme: _appColorScheme,
      cardTheme: cardTheme,
      listTileTheme: listTileTheme,
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
        iconSize: 35,
      );
  AppBarTheme get appBarTheme => AppBarTheme(
      systemOverlayStyle: colorSchemeLight!.systemUiOverlayStyle,
      backgroundColor: Colors.transparent,
      elevation: 1,
      shadowColor: colorSchemeLight!.alarm,
      titleTextStyle: TextStyle(color: colorSchemeLight!.blackMetal),
      iconTheme: IconThemeData(color: colorSchemeLight!.blackMetal),
      actionsIconTheme: IconThemeData(color: colorSchemeLight!.blackMetal),
      centerTitle: false);

  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          elevation: 1,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedIconTheme: const IconThemeData(size: 25),
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
  ListTileThemeData get listTileTheme => const ListTileThemeData(
      minVerticalPadding: 8, selectedColor: Colors.redAccent);
  TimePickerThemeData get pickerTheme => const TimePickerThemeData(
        inputDecorationTheme: InputDecorationTheme(),
      );
}
