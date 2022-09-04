import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medication_reminder_app/feature/home/model/pill_model.dart';
import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import 'package:provider/provider.dart';
import '../../../core/extension/image_extension.dart';

import '../../../product/widget/field/custom_text_field.dart';

class ReminderView extends StatelessWidget {
  ReminderView({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();

  String? pillImage;

  @override
  Widget build(BuildContext context) {
    DateTime? selectDate = context.watch<HomeViewModel>().selectDate;
    String? frequency = context.watch<HomeViewModel>().selectFrequency;
    return Scaffold(
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
              controller: _nameController,
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
                        pillImage = PillEnum.pillNames[index].toPng;
                      },
                      child: Card(
                          child: Image.asset(
                        PillEnum.pillNames[index].toPng,
                      )));
                },
              ),
            ),
            CustomTextField(
              title: DateFormat.yMd().format(selectDate),
              child: IconButton(
                  onPressed: () {
                    context.read<HomeViewModel>().getDateFromUser(context);
                  },
                  icon: const Icon(Icons.date_range)),
            ),
            CustomTextField(
              title: context.watch<HomeViewModel>().startTime,
              child: IconButton(
                  onPressed: () {
                    context.read<HomeViewModel>().getTimeUser(context);
                  },
                  icon: const Icon(
                    Icons.timer_sharp,
                  )),
            ),
            CustomTextField(
              title: frequency ?? 'None',
              child: DropdownButton(
                onChanged: (String? value) {
                  context.read<HomeViewModel>().getFrequency(value);
                },
                items: context
                    .watch<HomeViewModel>()
                    .frequency
                    .map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  },
                ).toList(),
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var reminder = PillModel.create(
                      title: _nameController.text,
                      pillImage: pillImage ?? '',
                      frequency: frequency,
                      time: selectDate);
                  HomeViewModel().cacheManager.putItem(reminder);
                  Navigator.pop(context);
                },
                child: const Center(child: Text('Add Reminder')))
          ],
        ),
      ),
    );
  }
}
