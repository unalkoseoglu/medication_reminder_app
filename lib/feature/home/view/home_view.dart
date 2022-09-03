import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/view/reminder_view.dart';

import '../model/pill_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
                          return Card(
                            child: ListTile(
                              onLongPress: () =>
                                  viewModel.cacheManager.deleteAtItem(index),
                              leading: Image.asset(
                                reminders[index].pillImage,
                                fit: BoxFit.cover,
                                height: 30,
                                width: 30,
                              ),
                              title: Text(reminders[index].name),
                            ),
                          );
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
