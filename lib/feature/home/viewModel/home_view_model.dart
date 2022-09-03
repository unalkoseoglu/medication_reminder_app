import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../product/manager/medicine_manager.dart';
import '../model/pill_model.dart';

class HomeViewModel with ChangeNotifier {
  late ICacheManager<PillModel> cacheManager;
  bool value = false;

  HomeViewModel() {
    cacheManager = PillCacheManager('medicin');
  }

  void isCheck() {
    notifyListeners();
  }
}
