import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class AppInitiliaze {
  Future<void> initBeforeAppStart() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
