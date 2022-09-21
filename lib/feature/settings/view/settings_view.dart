import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';

import '../../../core/init/app/constants/language_constants.dart';
import '../../../product/init/lang/locale_keys.g.dart';
import '../../../core/extension/image_extension.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: LocaleKeys.settings.tr(),
      ),
      body: Column(
        children: [
          ListTile(
            leading: SizedBox(
                height: context.h, child: const Icon(Icons.language_rounded)),
            title: Text(LocaleKeys.lang.tr()),
            subtitle: Text(LocaleKeys.language.tr()),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(LocaleKeys.lang.tr()),
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    actions: [
                      IconButton(
                        onPressed: () {
                          context
                              .setLocale(LanguageConstants.instance.trLocale);
                          context.router.pop();
                        },
                        icon: Image.asset('turkey'.icon),
                      ),
                      IconButton(
                          onPressed: () {
                            context
                                .setLocale(LanguageConstants.instance.enLocale);
                            context.router.pop();
                          },
                          icon: Image.asset('US'.icon))
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
/*//?
context.setLocale(LanguageConstants.instance.trLocale);*/