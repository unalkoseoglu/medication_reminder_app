import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:medication_reminder_app/product/service/local_notification_service.dart';

import '../../../core/init/app/base/viewModel/base_view_model.dart';
import '../model/pill_model.dart';

class ReminderViewModel with ChangeNotifier, BaseViewModel {
  late final LocalNotificationService notificationService;
  bool isSelect = false;
  DateTime selectDate = DateTime.now();
  String startTime = DateFormat("HH:mm a").format(DateTime.now()).toString();

  String selectedImage = PillEnum.pillNames[0];
  bool selectImage = false;
  void Function(String selectedImage)? onChangeImage;

  TextEditingController? nameController;
  TextEditingController? amountController;

  ReminderViewModel() {
    notificationService = LocalNotificationService();

    notificationService.intialize();
    nameController = TextEditingController();
    amountController = TextEditingController();
  }

  void addReminder(PillModel item, BuildContext context) {
    cacheManager.addItem(item);

    notifyListeners();
  }

  void selectedDate(DateTime selectedDate) {
    selectDate = selectedDate;

    notifyListeners();
  }

  void getTimeUser(context) async {
    var alarmTime = await _showTimePicker(context);
    String formatedTime = alarmTime.format(context);
    startTime = formatedTime;

    notifyListeners();
  }

  void selectImageChange(String imageSelect) {
    if (onChangeImage != null) {
      onChangeImage!(imageSelect);
    }
    selectedImage = imageSelect;

    notifyListeners();
  }

  _showTimePicker(BuildContext context) {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        cancelText: '',
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split(" ")[0])));
  }

  /*
  //? Zaman aralığı seçimi
   void getFrequency(String? selectedFrequency) {
    selectFrequency = selectedFrequency;
    notifyListeners();
  } */
  /* 
 //? Tarih seçimi
  void getDateFromUser(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (pickerDate != null) {
      selectDate = pickerDate;

      selectDateText = DateFormat.yMd().format(selectDate);
    }

    notifyListeners();
  } */
}
