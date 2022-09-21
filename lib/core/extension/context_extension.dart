import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/companents/sizedBox/space_sized_box.dart';
import 'package:medication_reminder_app/core/init/app/constants/responsivity_constants.dart';

import '../companents/sizedBox/space_sized_box.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get appTheme => Theme.of(this);
  MaterialColor get ramdomColor => Colors.primaries[Random().nextInt(17)];
  bool get isKeyboradOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension MediaQueryExtension on BuildContext {
  double get h => mediaQuery.size.height;
  double get w => mediaQuery.size.width;

  double height(double val) => h * val;
  double width(double val) => w * val;
}

extension DeviceOSExtensinon on BuildContext {
  bool get isAndroidDevice => Platform.isAndroid;
  bool get isIOSDevice => Platform.isIOS;
}

extension ContextDeviceTypeExtension on BuildContext {
  bool get isHandset => w >= ResponsivityConstants.instance.handset &&
          w < ResponsivityConstants.instance.tablet
      ? true
      : false;
  bool get isTablet =>
      w >= ResponsivityConstants.instance.tablet ? true : false;
}

extension PaddingExtension on BuildContext {
  EdgeInsets paddingAll(double num) => EdgeInsets.all(h * num);
  EdgeInsets paddingHorizontal(double num) =>
      EdgeInsets.symmetric(horizontal: h * num);
  EdgeInsets paddingVertical(double num) =>
      EdgeInsets.symmetric(vertical: h * num);
  EdgeInsets paddingBottom(double num) => EdgeInsets.only(bottom: h * num);
  EdgeInsets paddingTop(double num) => EdgeInsets.only(top: h * num);
  EdgeInsets paddingLeft(double num) => EdgeInsets.only(left: h * num);
  EdgeInsets paddingRight(double num) => EdgeInsets.only(right: h * num);
}

extension SizedBoxExtension on BuildContext {
  Widget emptySizedWidthBox(double num) => SpaceSizedWidthBox(width: num);
  Widget emptySizedHeightBox(double num) => SpaceSizedHeightBox(height: num);
}

extension RadiusExtension on BuildContext {
  Radius radius(double num) => Radius.circular(w * num);
}

extension BorderExtension on BuildContext {
  BorderRadius borderRadiusAll(double num) =>
      BorderRadius.all(Radius.circular(w * num));

  RoundedRectangleBorder rectangleBorderAll(double num) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * num));

  RoundedRectangleBorder rectangleBorderVertical(double num) =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(h * num)));

  RoundedRectangleBorder rectangleBorderHorizontal(double num) =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.horizontal(left: Radius.circular(w * num)));
}
