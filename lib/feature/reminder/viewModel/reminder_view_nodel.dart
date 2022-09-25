import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:medication_reminder_app/product/service/local_notification_service.dart';

import '../../../core/init/app/base/viewModel/base_view_model.dart';
import '../../../core/init/app/constants/cache_constants.dart';
import '../../../product/manager/medicine_manager.dart';
import '../model/pill_model.dart';

class ReminderViewModel with ChangeNotifier, BaseViewModel {
  late final LocalNotificationService notificationService;
  bool isSelect = false;
  DateTime selectDate = DateTime.now();

  String startTime = DateFormat("HH:mm a").format(DateTime.now()).toString();
  String subtitle(locale, date) =>
      DateFormat('EEEE, d MMMM y', locale).format(date);

  String selectedImage = PillEnum.pillNames[0];
  bool selectImage = false;
  void Function(String selectedImage)? onChangeImage;

  TextEditingController? nameController;
  TextEditingController? amountController;
  TextEditingController? repeatController;
  late ICacheManager<PillModel> cacheManager;

  ReminderViewModel() {
    notificationService = LocalNotificationService();
    cacheManager = PillCacheManager(CacheConstants.pillCache);
    notificationService.intialize();
    nameController = TextEditingController();
    amountController = TextEditingController();
    repeatController = TextEditingController();
  }

  void addReminder(PillModel item, BuildContext context) {
    cacheManager.addItem(item);

    notifyListeners();
  }

  Future<void> scheduleNotification(
      {required PillModel item, required String dateFormat}) async {
    DateTime date = DateFormat(dateFormat).parse(item.time.toString());
    var myTime = DateFormat("HH:mm").format(date).toString();

    notificationService.showScheduleNotification(
        id: item.key,
        item: item,
        hour: int.parse(myTime.split(":")[0]),
        minute: int.parse(myTime.split(":")[1]));
  }

  void selectImageChange(String imageSelect) {
    if (onChangeImage != null) {
      onChangeImage!(imageSelect);
    }
    selectedImage = imageSelect;

    notifyListeners();
  }

  void getTimeUser(context, reminderTime) async {
    var notifiTime = await reminderTime;

    String formatedTime = notifiTime.format(context);
    startTime = formatedTime;

    notifyListeners();
  }
}
