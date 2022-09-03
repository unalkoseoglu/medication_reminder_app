import 'package:flutter/material.dart';
import 'package:medication_reminder_app/feature/home/model/pill_model.dart';
import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/product/constants/enum/pill_enum.dart';
import '../../../core/extension/image_extension.dart';

import '../../../product/widget/field/custom_text_field.dart';

class ReminderView extends StatelessWidget {
  ReminderView({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  String? pillImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
            name: 'Medicine Name',
            controller: nameController,
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
                      print(pillImage);
                    },
                    child: Card(
                        child: Image.asset(
                      PillEnum.pillNames[index].toPng,
                    )));
              },
            ),
          ),
          IconButton(
              onPressed: () {
                var reminder = PillModel.create(
                    title: nameController.text, pillImage: pillImage ?? '');
                HomeViewModel().cacheManager.putItem(reminder);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
    );
  }
}
