import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

import '../../init/lang/locale_keys.g.dart';

class ItemListTile extends ListTile {
  ItemListTile(
    BuildContext context, {
    Key? key,
    required Widget title,
    Widget? subtitle,
    bool soonText = false,
    required IconData icon,
    Function()? onTap,
    bool isExpanded = false,
  }) : super(
            key: key,
            visualDensity: const VisualDensity(horizontal: 4),
            title: title,
            subtitle: isExpanded ? subtitle : null,
            leading: SizedBox(height: context.h, child: Icon(icon)),
            onTap: onTap,
            trailing: soonText
                ? Text(LocaleKeys.settings_soon.tr())
                : isExpanded
                    ? const Icon(Icons.expand_circle_down_outlined)
                    : const Icon(Icons.chevron_right_rounded));
}
