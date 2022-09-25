import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/core/extension/image_extension.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/card/pill_card.dart';

import 'package:provider/provider.dart';

import '../../../core/init/app/base/view/base_view.dart';
import '../../../product/widget/custom_bottom_sheet.dart';
import '../../reminder/model/pill_model.dart';
import '../date/view/date_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = DateFormat('EEEEE', context.locale.toString())
        .format(DateTime.now())
        .toString();
    final String subtitle = DateFormat('d MMMM y', context.locale.toString())
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
              preferredSize: context.height(0.00025),
              subtitle: subtitle,
              title: title,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
              child: Column(
                children: [
                  _buildDateView(context),
                  context.emptySizedHeightBox(0.07),
                ],
              ),
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

  Widget _buildDateView(BuildContext context) {
    return SizedBox(
        height: context.height(0.14),
        width: context.w,
        child: DateView(
          DateTime.now(),
          initialSelectDate: DateTime.now(),
          onDateChange: (selectedDate) =>
              context.read<HomeViewModel>().selectedDate(selectedDate),
        ));
  }

  Widget _circularProgses(BuildContext context) {
    return Lottie.asset('pills'.lottie,
        height: context.height(.2), width: context.w);
  }

  ListView _reminderListView(
      List<PillModel> reminders, HomeViewModel viewModel) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: reminders.length,
        itemBuilder: (BuildContext context, int index) {
          if (DateFormat.yMd(context.locale.toString())
                  .format(reminders[index].date) ==
              DateFormat.yMd(context.locale.toString())
                  .format(context.watch<HomeViewModel>().selectDate)) {
            return _buildCard(context, reminders, index);
          }
          return const SizedBox.shrink();
        });
  }

  PillCard _buildCard(
      BuildContext context, List<PillModel> reminders, int index) {
    return PillCard(
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
}
