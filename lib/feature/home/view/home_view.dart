import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/view/reminder_view.dart';
import 'package:provider/provider.dart';

import '../model/pill_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Your Medicines Reminder',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.green,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add Reminder'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ReminderView()));
        },
      ),
      body: Column(
        children: [
          Container(
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectedTextColor: Colors.white,
              selectionColor: Colors.redAccent,
              onDateChange: (selectedDate) {
                context.read<HomeViewModel>().selectedDate(selectedDate);
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<PillModel>>(
              valueListenable: viewModel.cacheManager.listenToReminder(),
              builder: (context, Box<PillModel> box, Widget? child) {
                var reminders = box.values.toList();
                return reminders.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: reminders.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (reminders[index].time ==
                                  context.watch<HomeViewModel>().selectDate ||
                              reminders[index].frequency == 'Daily') {
                            return Card(
                              child: ListTile(
                                onLongPress: () =>
                                    viewModel.cacheManager.deleteAtItem(index),
                                leading: Image.asset(
                                  reminders[index].pillImage ?? '',
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30,
                                ),
                                title: Text(reminders[index].name),
                                subtitle: Text(DateFormat.yMd().format(
                                    reminders[index].time ?? DateTime.now())),
                                trailing: Text(reminders[index].frequency),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
