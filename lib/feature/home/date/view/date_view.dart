import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:provider/provider.dart';

import '../viewModel/date_view_model.dart';

class DateView extends StatelessWidget {
  final DateTime startDate;

  final DateTime initialSelectDate;

  final void Function(DateTime selectedDate) onDateChange;

  final List<Color> selectionColors = <Color>[
    MyColors().jamaicanJade,
    MyColors().stampPadGreen,
  ];
  final Color deactivedColor = Colors.white;
  final Color selectedTextColor = Colors.white;
  final Color deactivedTextColor = MyColors().newBuryPort;
  final List<BoxShadow> selectionBoxShadow = <BoxShadow>[
    BoxShadow(
      color: MyColors().jamaicanJade,
      blurRadius: 8,
      spreadRadius: 1,
      //offset: const Offset(1, 1),
    )
  ];

  final int daysCount;

  DateView(
    this.startDate, {
    Key? key,
    required this.initialSelectDate,
    required this.onDateChange,
    this.daysCount = 250,
  }) : super(key: key);

  final DateViewModel viewModel = DateViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: daysCount,
      shrinkWrap: true,
      controller: viewModel.scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        DateTime dates = startDate.add(Duration(days: index));
        DateTime date;
        date = DateTime(dates.year, dates.month, dates.day);

        context.watch<DateViewModel>().isSelected =
            context.watch<DateViewModel>().initialSelectedDate != null
                ? viewModel.compareDate(
                    date, context.watch<DateViewModel>().initialSelectedDate)
                : false;

        return _BuildDateTimeline(
          selectionColors: context.watch<DateViewModel>().isSelected
              ? selectionColors
              : [Colors.white, Colors.white],
          date: date,
          selectedTextColor: context.watch<DateViewModel>().isSelected
              ? selectedTextColor
              : deactivedTextColor,
          onDateSelected: (selectedDate) {
            onDateChange(selectedDate);

            context.read<DateViewModel>().selectDate(selectedDate);
          },
          selectionBoxShadow: context.watch<DateViewModel>().isSelected
              ? selectionBoxShadow
              : [],
        );
      },
    );
  }
}

class _BuildDateTimeline extends StatelessWidget {
  final void Function(DateTime selectedDate)? onDateSelected;
  const _BuildDateTimeline({
    Key? key,
    required this.onDateSelected,
    required this.selectionColors,
    required this.selectionBoxShadow,
    required this.date,
    required this.selectedTextColor,
  }) : super(key: key);

  final List<Color> selectionColors;
  final List<BoxShadow> selectionBoxShadow;

  final DateTime date;
  final Color? selectedTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(5),
            width: context.width(0.15),
            decoration: BoxDecoration(
              boxShadow: selectionBoxShadow,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: selectionColors),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //?Date Month Text
                /*  Text(
                  DateFormat("MMM", locale).format(date).toUpperCase(),
                  style: context.textTheme.bodySmall!.copyWith(
                      color: selectedTextColor ?? Colors.transparent,
                      fontWeight: FontWeight.w800),
                ), //Month */
                FittedBox(
                  child: Text(
                    date.day.toString(),
                    textScaleFactor: context.textScaleFactor,
                    style: context.textTheme.headline4!.copyWith(
                        color: selectedTextColor, fontWeight: FontWeight.w700),
                  ),
                ), //Date
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: FittedBox(
                    child: Text(
                      DateFormat("E", context.locale.toString()).format(date),
                      textScaleFactor: context.textScaleFactor,
                      style: context.textTheme.subtitle2!.copyWith(
                          color: selectedTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ), //WeekDay
              ],
            ),
          ),
          onTap: () {
            if (onDateSelected != null) {
              onDateSelected!(date);
            }
          }),
    );
  }
}

class MyColors {
  final Color jamaicanJade = const Color(0xff62dbc6);
  final Color stampPadGreen = const Color(0xff309f8c);
  final Color heartFelt = const Color(0xffffafc6);
  final Color ultraRed = const Color(0xffff6c87);
  final Color yankesBlue = const Color(0xff1e2843);
  final Color newBuryPort = const Color(0xff45597a);
  final Color droplet = const Color.fromARGB(43, 173, 218, 253);
}
