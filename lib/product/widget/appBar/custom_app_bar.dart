import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(BuildContext context,
      {Key? key,
      required String title,
      String subtitle = '',
      Widget? child,
      IconData? icon,
      List<Widget>? actions,
      bool isLeading = false,
      double preferredSize = 0,
      void Function()? onPressed})
      : super(
          key: key,
          title: subtitle.isNotEmpty
              ? Padding(
                  padding: context.paddingTop(0.02),
                  child: _buildTitleSub(subtitle, context, title),
                )
              : Padding(
                  padding: context.paddingTop(0.02),
                  child: _buildTitle(title, context),
                ),

          shape: RoundedRectangleBorder(
              borderRadius: context.borderRadiusAll(0.08)),
          leading: isLeading ? _buildLeading(context) : null,
          actions: actions,
          automaticallyImplyLeading: false,
          centerTitle: subtitle.isNotEmpty ? false : true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(context.height(preferredSize)),
            child: Padding(
              padding: context.paddingLeft(0.02),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
          elevation: 0,
          //backgroundColor: Colors.transparent
        );

  static IconButton _buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.chevron_left_outlined),
    );
  }

  static Text _buildTitle(String title, BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge,
    );
  }

  static Column _buildTitleSub(
      String subtitle, BuildContext context, String title) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: context.paddingBottom(0.002),
        child: Text(
          subtitle,
          style: context.textTheme.titleLarge,
        ),
      ),
      Text(
        title,
        style: context.textTheme.titleMedium,
      ),
    ]);
  }
}
