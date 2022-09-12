import 'package:flutter/widgets.dart';

class DateViewModel extends ChangeNotifier {
  ScrollController? scrollController;

  DateTime initialSelectedDate = DateTime.now();
  bool isSelected = false;
  bool isDeactived = false;

  void Function(DateTime selectedDate)? onDateChange;

  DateViewModel() {
    scrollController = ScrollController();
  }
  void startDateSelect(int index) {}

  bool compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  void selectDate(DateTime selectedDate) {
    isSelect();
    if (isDeactived) return;
    if (onDateChange != null) {
      onDateChange!(selectedDate);
    }
    initialSelectedDate = selectedDate;

    notifyListeners();
  }

  void isSelect() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
