import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/core/extension/image_extension.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/card/custom_card.dart';

import 'package:provider/provider.dart';

import '../../../core/init/app/base/view/base_view.dart';
import '../../../product/widget/custom_bottom_sheet.dart';
import '../../reminder/model/pill_model.dart';
import '../date/view/date_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
              preferredSize: 0.2,
              subtitle: subtitle,
              title: title,
              child: _buildDateView(context),
            ),
            body: ValueListenableBuilder<Box<PillModel>>(
              valueListenable: viewModel.cacheManager.listenToReminder(),
              builder: (context, Box<PillModel> box, Widget? child) {
                var reminders = box.values.toList();

                return reminders.isEmpty
                    ? _circularProgses(context)
                    : Padding(
                        padding: context.paddingAll(0.02),
                        child: _reminderListView(reminders, viewModel),
                      );
              },
            ));
      },
    );
  }

  ListView _reminderListView(
      List<PillModel> reminders, HomeViewModel viewModel) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: reminders.length,
        itemBuilder: (BuildContext context, int index) {
          if (DateFormat.yMd(context.locale.toString())
                  .format(reminders[index].time) ==
              DateFormat.yMd(context.locale.toString())
                  .format(context.watch<HomeViewModel>().selectDate)) {
            viewModel.scheduleNotification(item: reminders[index]);

            return _buildCard(context, reminders, index);
          }
          return const SizedBox.shrink();
        });
  }

  CustomCard _buildCard(
      BuildContext context, List<PillModel> reminders, int index) {
    return CustomCard(
        item: reminders[index],
        onTap: () => customBottomSheet(context, removeReminder: () {
              context
                  .read<HomeViewModel>()
                  .cancelReminder(index: index, item: reminders[index]);
              context.router.pop();
            }, takePill: () {
              context.read<HomeViewModel>().cancelReminder(
                    index: index,
                    item: reminders[index],
                  );
              context.router.pop();
            }));
  }

  Widget _circularProgses(BuildContext context) {
    return Lottie.asset('pills'.lottie,
        height: context.height(.2), width: context.w);
  }

  Widget _buildDateView(BuildContext context) {
    return SizedBox(
        height: context.height(0.17),
        width: context.w,
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
