import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/init/app/constants/language_constants.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';

import '../../../product/init/lang/locale_keys.g.dart';

class SettingsWiew extends StatelessWidget {
  const SettingsWiew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: LocaleKeys.settings.tr()),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.setLocale(LanguageConstants.instance.enLocale);
                },
                icon: const Icon(Icons.flag_circle_rounded)),
            IconButton(
                onPressed: () {
                  context.setLocale(LanguageConstants.instance.trLocale);
                },
                icon: const Icon(
                  Icons.flag_circle_rounded,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
