import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';
import 'package:medication_reminder_app/product/widget/card/custom_card.dart';

import '../../../feature/reminder/model/pill_model.dart';

class PillCard extends StatelessWidget {
  const PillCard({Key? key, required this.item, this.onTap}) : super(key: key);

  final PillModel item;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ICustomCard(
        child: Padding(
      padding: context.paddingVertical(0.01),
      child: ListTile(
          onTap: onTap,
          visualDensity: const VisualDensity(vertical: 4),
          leading: _pillImage(context),
          title: Text(
            item.name,
            style: context.textTheme.headline6,
          ),
          subtitle: Text(item.amount),
          trailing: RotatedBox(
            quarterTurns: -3,
            child: Text(item.time.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.black54)),
          )),
    ));
  }

  Widget _pillImage(BuildContext context) {
    return SizedBox(
      height: context.h,
      child: Image.asset(
        item.pillImage ?? '',
        width: context.width(0.2),
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
