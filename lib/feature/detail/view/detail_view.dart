import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/init/app/base/view/base_view.dart';
import 'package:medication_reminder_app/feature/detail/viewModel/detail_view_model.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/card/custom_card.dart';

import '../../reminder/model/pill_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.reminder}) : super(key: key);
  final PillModel reminder;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DetailViewModel(),
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Scaffold(
        appBar: CustomAppBar(context, title: 'Detail Reminder'),
        body: Center(
            child: CustomCard(
                reminder: reminder,
                onLongPress: () {},
                textTheme: Theme.of(context).textTheme)),
      ),
    );
  }
}
