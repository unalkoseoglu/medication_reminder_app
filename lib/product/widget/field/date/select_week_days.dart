/* import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class SelectWeekDays extends StatefulWidget {
  List<DayInWeek> days = [
    DayInWeek('Sun'),
    DayInWeek('Mon'),
    DayInWeek('Tue'),
    DayInWeek('Wed'),
    DayInWeek('Thu'),
    DayInWeek('Fri'),
    DayInWeek('Sat'),
  ];

  final Function onSelect;
  Color? selectedDayColor;
  SelectWeekDays({
    Key? key,
    required this.days,
    required this.onSelect,
    this.selectedDayColor,
  }) : super(key: key);

  @override
  _SelectWeekDayState createState() => _SelectWeekDayState(days);
}

class DayInWeek {
  String dayName;
  String dayKey;
  bool isSelected = false;
  DayInWeek(
    this.dayName, {
    required this.dayKey,
    this.isSelected = false,
  });

  void isSelectedChange() {
    isSelected = !isSelected;
  }
}

class _SelectWeekDayState extends State<SelectWeekDays> {
  _SelectWeekDayState(List<DayInWeek> days) : _daysInWeek = days;
  List<String> selectedDays = [];

  final List<DayInWeek> _daysInWeek = [DayInWeek('Sunday', dayKey: '0')];

  @override
  void initState() {
    super.initState();
    for (var element in _daysInWeek) {
      if (element.isSelected) {
        selectedDays.add(element.dayKey);
      }
    }
  }

  void _getSelectedweekDays(bool isSelected, String day) {
    if (isSelected == true) {
      if (!selectedDays.contains(day)) {
        selectedDays.add(day);
      }
    } else if (isSelected == false) {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      }
    }
    widget.onSelect(selectedDays.toList());
  }

  Color? _handleTextColor(bool onSelect) {
    Color? textColor = Colors.black;
    if (onSelect == true) {
      if (widget.selectedDayColor == null) {
        textColor = Colors.black;
      } else {
        textColor = widget.selectedDayColor;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(DatePicke(), date);
  }
}
 */