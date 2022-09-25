import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  List<bool> isExpanded = [false, false];

  void expandedChange(int index) {
    isExpanded[index] = !isExpanded[index];

    notifyListeners();
  }
}
