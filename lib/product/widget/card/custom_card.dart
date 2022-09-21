import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

import '../../../feature/reminder/model/pill_model.dart';

class ICustomCard extends Card {
  const ICustomCard({Key? key, Widget? child})
      : super(
          key: key,
          child: child,
        );
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.item, this.onTap})
      : super(key: key);

  final PillModel item;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ICustomCard(
        child: ListTile(
            onTap: onTap,
            visualDensity: const VisualDensity(vertical: 4),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            leading: _pillImage(context),
            title: Text(
              item.name,
              style: context.textTheme.headline6,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(item.amount),
                ),
                SizedBox(
                  height: context.height(0.04),
                  width: context.w,
                  child: ScheduleList(
                    count: 2,
                    width: context.width(0.0006),
                    textScale: 0.8,
                  ),
                ),
              ],
            ),
            trailing: RotatedBox(
              quarterTurns: -3,
              child: Text(item.alarmTime,
                  textAlign: TextAlign.center,
                  style: context.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black54)),
            )));
  }

  SizedBox _pillImage(BuildContext context) {
    return SizedBox(
      height: context.height(0.2),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(item.pillImage ?? '',
            width: context.width(0.2), fit: BoxFit.scaleDown),
      ),
    );
  }
}

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    Key? key,
    this.count,
    this.width,
    this.textScale,
  }) : super(key: key);
  final int? count;
  final double? width;
  final double? textScale;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: context.width(width ?? 0.1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.redAccent.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('After Breakfast',
                    style: context.textTheme.bodySmall!
                        .copyWith(color: Colors.red),
                    textScaleFactor: textScale,
                    maxLines: 1),
              ),
            ),
          ),
        );
      },
    );
  }
}
