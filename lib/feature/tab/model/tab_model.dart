import 'package:flutter/material.dart';
import 'package:medication_reminder_app/feature/home/view/home_view.dart';

import '../../settings/view/settings_view.dart';

class _TabModel {
  final Widget page;
  final IconData icon;

  _TabModel({required this.page, required this.icon});
}

class TabModels {
  late final List<_TabModel> tabItems;

  TabModels.create() {
    tabItems = [
      _TabModel(page: HomeView(), icon: Icons.home),
      _TabModel(page: const SettingsWiew(), icon: Icons.person),
    ];
  }
}
