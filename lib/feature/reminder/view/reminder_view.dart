import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/base/view/base_view.dart';

import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/viewModel/reminder_view_nodel.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/button/my_elevated_button.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/image_extension.dart';

import '../../../product/widget/field/custom_text_field.dart';
import '../model/pill_model.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({Key? key}) : super(key: key);
  final String title = 'New Reminder';

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderViewModel>(
      viewModel: ReminderViewModel(),
      onModelReady: (model) {
        model.cacheManager;
      },
      onPageBuilder: (BuildContext context, ReminderViewModel viewModel) =>
          Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: CustomAppBar(context,
            icon: Icons.chevron_left,
            title: title,
            child: MyElevatedButton(
                isIcon: true,
                onPressed: () {},
                child: const Icon(Icons.notifications))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'medicine'.toPng,
                  height: 200,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: 'Medicine Name',
                      controller: viewModel.nameController,
                    ),
                  ),
                  Expanded(
                      child: CustomTextField(
                    title: 'mg/ml',
                    controller: viewModel.amountController,
                  ))
                ],
              ),
              const Text('Type'),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PillEnum.pillNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: MyElevatedButton(
                        isIcon: true,
                        onPressed: () {
                          viewModel.selectedImage =
                              PillEnum.pillNames[index].toPng;
                        },
                        child: SizedBox(
                          width: 60,
                          child: Image.asset(
                            PillEnum.pillNames[index].toPng,
                          ),
                        ),
                      ),
                    );

                    /* InkWell(
                        onTap: () {
                          viewModel.selectedImage =
                              PillEnum.pillNames[index].toPng;
                        },
                        child: Container(
                            height: 50,
                            decoration: const BoxDecoration(),
                            child: FittedBox(
                              child: Card(
                                elevation: 0,
                                child: Image.asset(
                                  PillEnum.pillNames[index].toPng,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ))); */
                  },
                ),
              ),
              CustomTextField(
                title: context.watch<ReminderViewModel>().startTime,
                child: IconButton(
                    onPressed: () {
                      context.read<ReminderViewModel>().getTimeUser(context);
                    },
                    icon: const Icon(
                      Icons.timer_sharp,
                    )),
              ),
              MyElevatedButton(
                  onPressed: () {
                    var reminder = PillModel.create(
                      title:
                          ' ${viewModel.nameController?.text} ${viewModel.amountController?.text}',
                      pillImage: viewModel.selectedImage ?? '',
                      alarmTime:
                          Provider.of<ReminderViewModel>(context, listen: false)
                              .startTime,
                      time: Provider.of<HomeViewModel>(context, listen: false)
                          .selectDate,
                    );
                    context.read<ReminderViewModel>().addReminder(reminder);
                    print(reminder.key);
                    Navigator.pop(context);
                  },
                  child: const Center(child: Text('Add Reminder')))
            ],
          ),
        ),
      ),
    );
  }
}
