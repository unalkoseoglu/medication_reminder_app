import 'package:medication_reminder_app/core/utils/screen_size.dart';

extension NumExtension on num {
  double get h => ScreenSize.instance.getHeight(this);
  double get w => ScreenSize.instance.getWidth(this);
  double get sp => ScreenSize.instance.getSp(this);
}
