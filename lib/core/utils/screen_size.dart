import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/init/app/constants/app_constants.dart';
import 'package:medication_reminder_app/core/keys/global_key.dart';

class ScreenSize {
  static ScreenSize? _instance;
  static ScreenSize get instance {
    _instance ??= ScreenSize._init();
    return _instance!;
  }

  ScreenSize._init();

  Size get screenSize => Size(AppConstants().designDeviceSize.width,
      AppConstants().designDeviceSize.height);

  double getHeight(num heightNum) {
    double height = (screenSize.height * heightNum) /
        AppConstants().designDeviceSize.height;
    return height;
  }

  double getWidth(num widhtNum) {
    double width =
        (screenSize.width * widhtNum) / AppConstants().designDeviceSize.width;
    return width;
  }

  double getSp(num fontSize) => fontSize * _scaleText;
  double get sizeRatio =>
      screenSize.aspectRatio / AppConstants().designDeviceSize.aspectRatio;

  double get viewInsetsBottom =>
      MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!)
          .viewInsets
          .bottom;

  double get viewPaddingBottom =>
      MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!)
          .viewPadding
          .bottom;

  double get viewPaddingTop =>
      MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!)
          .viewPadding
          .top;

  double get _scaleText => min(_scaleWidth, _scaleHeight);
  double get _scaleHeight =>
      screenSize.height / AppConstants().designDeviceSize.height;
  double get _scaleWidth =>
      screenSize.width / AppConstants().designDeviceSize.width;
  double get viewBody =>
      screenSize.height -
      viewPaddingBottom -
      viewPaddingTop -
      AppBar().preferredSize.height;
}
