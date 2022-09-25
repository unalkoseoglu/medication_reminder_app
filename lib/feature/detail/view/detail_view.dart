import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/core/init/app/base/view/base_view.dart';
import 'package:medication_reminder_app/feature/detail/viewModel/detail_view_model.dart';
import 'package:medication_reminder_app/product/init/lang/locale_keys.g.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/card/custom_card.dart';

import '../../../product/widget/button/custom_elevated_button.dart';
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
        appBar: CustomAppBar(
          context,
          title: reminder.name,
          isLeading: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      reminder.pillImage ?? '',
                      height: 180,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: context.w,
                    decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          reminder.name,
                          style: context.textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ICustomCard(
                          child: ListTile(
                            horizontalTitleGap: 0,
                            leading: const SizedBox(
                              height: double.infinity,
                              child: Icon(
                                Icons.task_rounded,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),
                            title: Text(LocaleKeys.reminder_amount.tr()),
                            subtitle: Text(reminder.amount),
                          ),
                        ),
                        MyElevatedButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text('Take'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                /* right: 35.w,
                bottom: 400.h, */
                child: MyElevatedButton(
                    onPressed: () {}, child: const Text('Remove'))),
          ],
        ),
      ),
    );
  }
}
