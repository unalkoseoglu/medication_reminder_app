import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:medication_reminder_app/feature/reminder/model/pill_model.dart';

void main() {
  setUp(
    () {
      Hive.init('path');
    },
  );
  test(
    ' ReminderModel Box Create and Put ',
    () async {
      final box = await Hive.openBox<PillModel>('reminder');
      box.add(PillModel(id: '0', name: 'name', isComplete: false));

      expect(box.length, 1);
    },
  );
}
