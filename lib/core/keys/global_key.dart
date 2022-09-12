import 'package:flutter/widgets.dart';

class GlobalContextKey {
  static GlobalContextKey? _instance;
  static GlobalContextKey get instance {
    _instance ??= GlobalContextKey._init();
    return _instance!;
  }

  GlobalContextKey._init();

  GlobalKey get globalKey => GlobalKey();
}
