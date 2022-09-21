import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/keys/global_key.dart';
import 'package:medication_reminder_app/feature/home/date/viewModel/date_view_model.dart';
import 'package:medication_reminder_app/feature/settings/viewModel/settings_view_model.dart';

import 'package:medication_reminder_app/product/init/app/app_init.dart';
import 'package:medication_reminder_app/product/init/theme/app_theme_light.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:medication_reminder_app/product/init/navigation/app_router.dart';
import 'core/init/app/constants/app_constants.dart';
import 'core/init/app/constants/language_constants.dart';
import 'feature/home/viewModel/home_view_model.dart';
import 'feature/reminder/viewModel/reminder_view_nodel.dart';

Future<void> main() async {
  await AppInitiliaze().initBeforeAppStart();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => ReminderViewModel()),
      ChangeNotifierProvider(create: (_) => DateViewModel()),
      ChangeNotifierProvider(create: (_) => SettingsViewModel()),
    ],
    child: EasyLocalization(
        supportedLocales: LanguageConstants.instance.supportedLocales,
        path: AppConstants.langAssetPath,
        startLocale: LanguageConstants.instance.enLocale,
        saveLocale: true,
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      key: GlobalContextKey.instance.globalKey,
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      theme: AppThemeLight.instance.theme,
      title: 'Medication Reminder App',
      debugShowCheckedModeBanner: false,
    );
  }
}
