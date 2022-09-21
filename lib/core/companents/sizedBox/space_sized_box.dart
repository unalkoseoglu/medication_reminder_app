import 'package:flutter/widgets.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

class SpaceSizedWidthBox extends StatelessWidget {
  final double width;

  const SpaceSizedWidthBox({Key? key, required this.width})
      : assert(width > 0 && width < 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(width),
    );
  }
}

class SpaceSizedHeightBox extends StatelessWidget {
  final double height;

  const SpaceSizedHeightBox({Key? key, required this.height})
      : assert(height > 0 && height < 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.w * height,
    );
  }
}
