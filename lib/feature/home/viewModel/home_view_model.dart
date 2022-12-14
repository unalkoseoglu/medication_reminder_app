import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/init/app/constants/cache_constants.dart';
import 'package:medication_reminder_app/product/manager/medicine_manager.dart';

import 'package:medication_reminder_app/product/service/local_notification_service.dart';

import '../../../core/init/app/base/viewModel/base_view_model.dart';
import '../../reminder/model/pill_model.dart';

class HomeViewModel with ChangeNotifier, BaseViewModel {
  late final LocalNotificationService notificationService;

  DateTime selectDate = DateTime.now();
  bool isScroll = false;
  late ICacheManager<PillModel> cacheManager;

  HomeViewModel() {
    notificationService = LocalNotificationService();
    notificationService.intialize();
    cacheManager = PillCacheManager(CacheConstants.pillCache);
  }

  void clearOldReminder(List<PillModel> items) {
    items.isEmpty ? cacheManager.clear() : null;
  }

  void selectedDate(DateTime selectedDate) {
    selectDate = selectedDate;
    notifyListeners();
  }

  Future<void> cancelReminder(
      {required int index, required PillModel item}) async {
    await notificationService.cancelNotification(id: item.key);
    cacheManager.deleteAtItem(index);
    notifyListeners();
  }
}
