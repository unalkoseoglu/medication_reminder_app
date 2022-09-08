import 'package:medication_reminder_app/product/manager/medicine_manager.dart';

abstract class BaseViewModel {
  PillCacheManager cacheManager = PillCacheManager('mds');
}
