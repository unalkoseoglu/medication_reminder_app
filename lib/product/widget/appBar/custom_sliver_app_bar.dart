import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/home/date/view/date_view.dart';
import '../../../feature/home/viewModel/home_view_model.dart';
import '../button/my_elevated_button.dart';

class CustomSliverAppBar extends SliverAppBar {
  CustomSliverAppBar(
    BuildContext context, {
    Key? key,
    required double statusBarHeight,
    required double titleBarHeight,
    required String title,
  }) : super(
          key: key,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
          backgroundColor: Colors.blueGrey[50],
          expandedHeight: 240,
          snap: true,
          floating: true,
          flexibleSpace: _buildFlexibleBar(
              context, statusBarHeight, titleBarHeight, title),
        );

  static FlexibleSpaceBar _buildFlexibleBar(
    BuildContext context,
    double statusBarHeight,
    double titleBarHeight,
    String title,
  ) {
    return FlexibleSpaceBar(
        title: _builAppBar(title, context),
        titlePadding: const EdgeInsets.only(bottom: 145),
        background: Container(
          padding: EdgeInsets.only(top: statusBarHeight + titleBarHeight),
          height: statusBarHeight,
          child: CustomDateView(
            DateTime.now(),
            initialSelectDate: DateTime.now(),
            onDateChange: (selectedDate) {
              context.read<HomeViewModel>().selectedDate(selectedDate);
            },
          ),
        ));
  }

  static Row _builAppBar(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 35,
          child: FittedBox(
            child: MyElevatedButton(
                onPressed: () {}, child: const Icon(Icons.notifications)),
          ),
        ),
      ],
    );
  }
}
