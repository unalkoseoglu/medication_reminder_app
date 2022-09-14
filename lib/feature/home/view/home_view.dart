import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/product/init/lang/locale_keys.g.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/card/custom_card.dart';

import 'package:provider/provider.dart';

import '../../../core/init/app/base/view/base_view.dart';
import '../../reminder/model/pill_model.dart';
import '../date/view/date_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  // final String titleTR =
  // HomeViewModel().dateFormat!.format(DateTime.now()).toString();

  final subtitle = 'Hi Ünal';

  @override
  Widget build(BuildContext context) {
    final String title = DateFormat('d MMMM y', context.locale.toString())
        .format(DateTime.now())
        .toString();
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.cacheManager;
        },
        onPageBuilder: (BuildContext context, HomeViewModel viewModel) {
          return Scaffold(
            appBar: CustomAppBar(
              context,
              isHome: true,
              subtitle: subtitle,
              title: title,
              child: _buildDateView(context),
            ),
            body: ReminderListView(viewModel: viewModel),
          );
        });
  }

  SizedBox _buildDateView(BuildContext context) {
    return SizedBox(
        height: 130.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: DateView(
            DateTime.now(),
            initialSelectDate: DateTime.now(),
            onDateChange: (selectedDate) =>
                context.read<HomeViewModel>().selectedDate(selectedDate),
          ),
        ));
  }
}

class ReminderListView extends StatelessWidget {
  const ReminderListView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<PillModel>>(
      valueListenable: viewModel.cacheManager.listenToReminder(),
      builder: (context, Box<PillModel> box, Widget? child) {
        var reminders = box.values.toList();

        return reminders.isEmpty
            ? SizedBox(
                height: 50.h,
                child: Center(
                  child: Text(LocaleKeys.noReminder.tr()),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: reminders.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (DateFormat.yMd(context.locale.toString())
                              .format(reminders[index].time) ==
                          DateFormat.yMd(context.locale.toString()).format(
                              context.watch<HomeViewModel>().selectDate)) {
                        viewModel.scheduleNotification(item: reminders[index]);

                        return _buildCard(context, reminders, index);
                      }
                      return const SizedBox.shrink();
                    }),
              );
      },
    );
  }

  CustomCard _buildCard(
      BuildContext context, List<PillModel> reminders, int index) {
    return CustomCard(
        textTheme: Theme.of(context).textTheme,
        reminder: reminders[index],
        onLongPress: () => context
            .read<HomeViewModel>()
            .cancelReminder(index: index, item: reminders[index]));
  }
}
