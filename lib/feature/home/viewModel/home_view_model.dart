import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/product/constants/enum/frequency_enum.dart';

import '../../../product/manager/medicine_manager.dart';
import '../model/pill_model.dart';

class HomeViewModel with ChangeNotifier {
  late ICacheManager<PillModel> cacheManager;
  DateTime selectDate = DateTime.now();
  String? selectDateText;

  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  List<String> frequency = FrequencyEnum.frequencyNames;
  String? selectFrequency;

  HomeViewModel() {
    cacheManager = PillCacheManager('medici');
  }

  void selectedDate(DateTime selectedDate) {
    selectDate = selectedDate;
    notifyListeners();
  }

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
  }

  void getTimeUser(BuildContext context) async {
    var pickedTime = await _showTimePicker(context);
    String formatedTime = pickedTime.format(context);
    if (pickedTime != null) {
      startTime = formatedTime;
    }
    notifyListeners();
  }

  _showTimePicker(BuildContext context) {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        //![startTime] => 5:25 AM
        hour: int.parse(startTime.split(":")[0]),
        minute: int.parse(startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }

  void getFrequency(String? selectedFrequency) {
    selectFrequency = selectedFrequency;
    notifyListeners();
  }
}
