import 'package:flutter/widgets.dart';

class LanguageConstants {
  static LanguageConstants? _instance;
  static LanguageConstants get instance {
    _instance ??= LanguageConstants._init();
    return _instance!;
  }

  LanguageConstants._init();

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
