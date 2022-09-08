import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/core/base/viewModel/base_view_model.dart';
import 'package:medication_reminder_app/product/service/local_notification_service.dart';

import '../model/pill_model.dart';

class HomeViewModel with ChangeNotifier, BaseViewModel {
  late final LocalNotificationService notificationService;

  DateTime selectDate = DateTime.now();

  DatePickerController? pickerController;

  HomeViewModel() {
    notificationService = LocalNotificationService();
    notificationService.intialize();
    pickerController = DatePickerController();
  }

  void scheduleNotification({required PillModel item}) {
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

  Object? getSelectDate(List<PillModel> items, int index,
      {required Widget child}) {
    if (DateFormat.yMd().format(items[index].time) ==
        DateFormat.yMd().format(selectDate)) {
      child;
    }
    return const Text('data');
  }
}
