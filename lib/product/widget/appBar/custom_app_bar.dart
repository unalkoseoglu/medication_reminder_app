import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(BuildContext context,
      {Key? key,
      required String title,
      String? subtitle,
      Widget? child,
      IconData? icon,
      bool isHome = false,
      void Function()? onPressed})
      : super(
            key: key,
            iconTheme: const IconThemeData(color: Colors.black, size: 40),
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                child: Text(
                  subtitle ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(title),
            ]),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            leading: isHome
                ? null
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left_outlined),
                  ),
            automaticallyImplyLeading: false,
            centerTitle: false,
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
            bottom: isHome
                ? PreferredSize(
                    preferredSize: Size.fromHeight(140.h),
                    child: child ?? const SizedBox.shrink(),
                  )
                : null,
            elevation: 0,
            backgroundColor: Colors.transparent);
}
