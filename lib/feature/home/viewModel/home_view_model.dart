import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/core/base/viewModel/base_view_model.dart';
import 'package:medication_reminder_app/product/service/local_notification_service.dart';

import '../../reminder/model/pill_model.dart';

class HomeViewModel with ChangeNotifier, BaseViewModel {
  late final LocalNotificationService notificationService;

  DateTime selectDate = DateTime.now();

  DatePickerController? pickerController;

  HomeViewModel() {
    notificationService = LocalNotificationService();
    notificationService.intialize();

    pickerController = DatePickerController();
  }

  Future<void> scheduleNotification({required PillModel item}) async {
    DateTime date = DateFormat.jm().parse(item.alarmTime.toString());
    var myTime = DateFormat("HH:mm").format(date);
    notificationService.showScheduleNotification(
        id: item.key,
        item: item,
        hour: int.parse(myTime.toString().split(":")[0]),
        minute: int.parse(myTime.toString().split(":")[1]));
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
