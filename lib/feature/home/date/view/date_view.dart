import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../viewModel/date_view_model.dart';

class CustomDateView extends StatelessWidget {
  final DateTime startDate;

  final DateTime initialSelectDate;

  final void Function(DateTime selectedDate) onDateChange;

  final List<Color> selectionColors = <Color>[
    MyColors().heartFelt,
    MyColors().ultraRed,
  ];
  final Color deactivedColor = Colors.white;
  final Color selectedTextColor = Colors.white;
  final Color deactivedTextColor = MyColors().newBuryPort;
  final List<BoxShadow> selectionBoxShadow = <BoxShadow>[
    BoxShadow(
        color: MyColors().heartFelt,
        blurRadius: 12,
        spreadRadius: 2,
        offset: const Offset(1, 2))
  ];

  final int daysCount;
  final String locale;
  CustomDateView(
    this.startDate, {
    Key? key,
    required this.initialSelectDate,
    required this.onDateChange,
    this.daysCount = 250,
    this.locale = 'en_US',
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

        return _buildDateTimeline(
          selectionColors: context.watch<DateViewModel>().isSelected
              ? selectionColors
              : [Colors.white, Colors.white],
          date: date,
          selectedTextColor: context.watch<DateViewModel>().isSelected
              ? selectedTextColor
              : deactivedTextColor,
          locale: locale,
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

class _buildDateTimeline extends StatelessWidget {
  final void Function(DateTime selectedDate)? onDateSelected;
  const _buildDateTimeline({
    Key? key,
    required this.onDateSelected,
    required this.selectionColors,
    required this.selectionBoxShadow,
    required this.date,
    required this.selectedTextColor,
    required this.locale,
  }) : super(key: key);

  final List<Color> selectionColors;
  final List<BoxShadow> selectionBoxShadow;

  final DateTime date;
  final Color selectedTextColor;

  final String locale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8, bottom: 8),
      child: InkWell(
          child: Container(
            margin: const EdgeInsets.all(3),
            width: 60,
            decoration: BoxDecoration(
              boxShadow: selectionBoxShadow,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: selectionColors),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*
                  //?Date Month Text
                   Text(
                    DateFormat("MMM", locale)
                        .format(viewModel.date)
                        .toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            color: selectedTextColor,
                            fontWeight: FontWeight.w800),
                  ), //Month */
                  Text(
                    date.day.toString(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: selectedTextColor, fontWeight: FontWeight.w700),
                  ), //Date
                  Text(
                    DateFormat("E", locale).format(date),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: selectedTextColor, fontWeight: FontWeight.w700),
                  ), //WeekDay
                ],
              ),
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
  final Color heartFelt = const Color(0xffffafc6);
  final Color ultraRed = const Color(0xffff6c87);
  final Color yankesBlue = const Color(0xff1e2843);
  final Color newBuryPort = const Color(0xff45597a);
  final Color droplet = const Color.fromARGB(43, 173, 218, 253);
}
