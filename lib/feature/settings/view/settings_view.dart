import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/core/extension/image_extension.dart';
import 'package:medication_reminder_app/core/init/app/base/view/base_view.dart';
import 'package:medication_reminder_app/product/widget/appBar/custom_app_bar.dart';
import 'package:medication_reminder_app/product/widget/listView/item_list_tile.dart';
import 'package:provider/provider.dart';

import '../../../core/init/app/constants/language_constants.dart';
import '../../../product/init/lang/locale_keys.g.dart';
import '../viewModel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {},
      onPageBuilder: (context, viewModel) => Scaffold(
          appBar: CustomAppBar(
            context,
            title: LocaleKeys.settings_title.tr(),
            preferredSize: context.height(0.00001),
          ),
          body: ListView(
            children: [
              _buildLanguage(context),
              _buildNotifications(context),
              _buildDarkMode(context)
            ],
          )),
    );
  }

  ItemListTile _buildLanguage(BuildContext context) {
    return ItemListTile(context,
        title: Text(LocaleKeys.settings_lang.tr()),
        subtitle: SizedBox(
            width: context.width(0.2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () =>
                        context.setLocale(LanguageConstants.instance.trLocale),
                    icon: Image.asset('turkey'.icon)),
                IconButton(
                    onPressed: () =>
                        context.setLocale(LanguageConstants.instance.enLocale),
                    icon: Image.asset('US'.icon))
              ],
            )), onTap: () {
      context.read<SettingsViewModel>().expandedChange(0);
    },
        isExpanded: context.watch<SettingsViewModel>().isExpanded[0],
        icon: Icons.language);
  }

  ItemListTile _buildNotifications(BuildContext context) {
    return ItemListTile(context,
        title: Text(LocaleKeys.settings_notifications.tr()),
        soonText: true,
        icon: Icons.notifications);
  }

  ItemListTile _buildDarkMode(BuildContext context) {
    return ItemListTile(context,
        title: Text(LocaleKeys.settings_darkMode.tr()),
        soonText: true,
        icon: Icons.dark_mode_sharp);
  }
}


/*//?
context.setLocale(LanguageConstants.instance.trLocale);*/