import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/viewModel/reminder_view_nodel.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/button/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/image_extension.dart';

import '../../../core/init/app/base/view/base_view.dart';

import '../../../product/widget/field/custom_text_field.dart';
import '../model/pill_model.dart';

class ReminderView extends StatelessWidget {
  ReminderView({Key? key}) : super(key: key);
  final String title = 'New Reminder';
  final String subtitle = DateFormat('EEEE, d MMMM y').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderViewModel>(
      viewModel: ReminderViewModel(),
      onModelReady: (model) {
        model.cacheManager;
      },
      onPageBuilder: (BuildContext context, ReminderViewModel viewModel) =>
          Scaffold(
        appBar: CustomAppBar(
          context,
          title: title,
          subtitle: subtitle,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 250.h,
                  child: Center(
                    child: Image.asset(
                      'medicine'.toPng,
                      height: 200.h,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30))),
                  height: MediaQuery.of(context).size.height -
                      270.h -
                      kToolbarHeight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ITextField(
                          title: 'Medicine Name',
                          hint: 'Paracematol XL2',
                          controller: viewModel.nameController,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ITextField(
                                title: 'Amount',
                                hint: 'mg/ml',
                                controller: viewModel.amountController,
                                icon: Icons.category_rounded,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: MyElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<ReminderViewModel>()
                                        .getTimeUser(context);
                                  },
                                  child: const Icon(
                                    Icons.timer_sharp,
                                    size: 25,
                                  )),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Type',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                height: 90.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: PillEnum.pillNames.length,
                                  itemBuilder: (_, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: MyElevatedButton(
                                        color: context
                                                    .watch<ReminderViewModel>()
                                                    .selectedImage ==
                                                PillEnum.pillNames[index].toPng
                                            ? Colors.blue
                                            : null,
                                        isIcon: true,
                                        onPressed: () {
                                          context
                                              .read<ReminderViewModel>()
                                              .selectImageChange(
                                                  viewModel.selectedImage =
                                                      PillEnum.pillNames[index]
                                                          .toPng);
                                        },
                                        child: SizedBox(
                                          width: 60.w,
                                          child: Image.asset(
                                            PillEnum.pillNames[index].toPng,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        MyElevatedButton(
                            onPressed: () {
                              var reminder = PillModel.create(
                                title: viewModel.nameController!.text,
                                amount: viewModel.amountController!.text,
                                pillImage: viewModel.selectedImage,
                                alarmTime: Provider.of<ReminderViewModel>(
                                        context,
                                        listen: false)
                                    .startTime,
                                time: Provider.of<HomeViewModel>(context,
                                        listen: false)
                                    .selectDate,
                              );
                              context
                                  .read<ReminderViewModel>()
                                  .addReminder(reminder, context);

                              Navigator.pop(context);
                            },
                            child: const Center(child: Text('Add Reminder'))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
