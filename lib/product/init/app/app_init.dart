import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/init/app/constants/cache_constants.dart';
import '../../../feature/reminder/model/pill_model.dart';

class AppInitiliaze {
  Future<void> initBeforeAppStart() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter<PillModel>(PillModelAdapter());
    await Hive.openBox<PillModel>(CacheConstants.pillCache);
  }
}
