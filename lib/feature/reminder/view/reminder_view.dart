import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/base/view/base_view.dart';
import 'package:medication_reminder_app/feature/home/model/pill_model.dart';
import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/feature/reminder/viewModel/reminder_view_nodel.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/image_extension.dart';

import '../../../product/widget/field/custom_text_field.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderViewModel>(
      viewModel: ReminderViewModel(),
      onModelReady: (model) {
        model.cacheManager;
      },
      onPageBuilder: (BuildContext context, ReminderViewModel viewModel) =>
          Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'medicine'.toPng,
                height: 200,
              ),
              CustomTextField(
                title: 'Medicine Name',
                controller: viewModel.nameController,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PillEnum.pillNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          viewModel.selectedImage =
                              PillEnum.pillNames[index].toPng;
                        },
                        child: Card(
                            child: Image.asset(
                          PillEnum.pillNames[index].toPng,
                        )));
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
              ElevatedButton(
                  onPressed: () {
                    var reminder = PillModel.create(
                      title: viewModel.nameController?.text ?? 'Medicine',
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
