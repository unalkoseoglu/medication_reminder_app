import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(BuildContext context,
      {Key? key,
      required String title,
      String subtitle = '',
      Widget? child,
      IconData? icon,
      bool isLeading = false,
      double preferredSize = 0,
      void Function()? onPressed})
      : super(
            key: key,
            title: subtitle.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                          child: Text(
                            subtitle,
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          title,
                          style: context.textTheme.titleLarge,
                        ),
                      ])
                : Text(
                    title,
                    style: context.textTheme.titleLarge,
                  ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10))),
            leading: isLeading
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left_outlined),
                  )
                : null,
            automaticallyImplyLeading: false,
            centerTitle: subtitle.isNotEmpty ? false : true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(context.height(preferredSize)),
              child: child ?? const SizedBox.shrink(),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent);
}
