import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/feature/detail/view/detail_view.dart';
import 'package:medication_reminder_app/feature/reminder/view/reminder_view.dart';
import 'package:medication_reminder_app/feature/settings/view/settings_view.dart';
import 'package:medication_reminder_app/feature/tab/tab_view.dart';
import '../../../feature/home/view/home_view.dart';
import '../../../feature/reminder/model/pill_model.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: TabView, initial: true, children: [
      AutoRoute(
          page: HomeView, children: <AutoRoute>[AutoRoute(page: DetailView)]),
      AutoRoute(page: SettingsView)
    ]),
    AutoRoute(page: ReminderView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
