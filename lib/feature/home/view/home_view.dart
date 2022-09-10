import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/core/base/view/base_view.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/view/reminder_view.dart';

import 'package:provider/provider.dart';

import '../../../product/widget/appBar/custom_sliver_app_bar.dart';
import '../../reminder/model/pill_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final String title = 'Your Medicines\nReminder';

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.cacheManager;
        },
        onPageBuilder: (BuildContext context, HomeViewModel viewModel) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReminderView()));
                },
              ),
              body: CustomScrollView(slivers: <Widget>[
                CustomSliverAppBar(context,
                    title: title,
                    titleBarHeight: 110,
                    statusBarHeight: MediaQuery.of(context).padding.top),
                SliverToBoxAdapter(
                  child: ValueListenableBuilder<Box<PillModel>>(
                    valueListenable: viewModel.cacheManager.listenToReminder(),
                    builder: (context, Box<PillModel> box, Widget? child) {
                      var reminders = box.values.toList();

                      return reminders.isEmpty
                          ? const Center(child: Text('No Reminder'))
                          : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: reminders.length,
                              itemBuilder: (BuildContext context, int index) {
                                //print(reminders[index].time);
                                if (DateFormat.yMd()
                                        .format(reminders[index].time) ==
                                    DateFormat.yMd().format(context
                                        .watch<HomeViewModel>()
                                        .selectDate)) {
                                  viewModel.scheduleNotification(
                                    item: reminders[index],
                                  );

                                  return Card(
                                      child: ListTile(
                                    onLongPress: () => context
                                        .read<HomeViewModel>()
                                        .cancelReminder(
                                            index: index,
                                            item: reminders[index]),
                                    leading: Image.asset(
                                      reminders[index].pillImage ?? '',
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30,
                                    ),
                                    title: Text(reminders[index].name),
                                    subtitle: Text(reminders[index].alarmTime),
                                  ));
                                }
                                return const SizedBox(height: 0);
                              });
                    },
                  ),
                ),
              ]));
        });
  }
}
