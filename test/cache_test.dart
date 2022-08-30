import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication_reminder_app/features/home/model/reminder_model.dart';

void main() {
  setUp(
    () {
      Hive.init('path');
    },
  );
  test(
    ' ReminderModel Box Create and Put ',
    () async {
      final box = await Hive.openBox<ReminderModel>('reminder');
      box.add(
          ReminderModel(name: 'name', image: 'adaddd', description: 'adsd a'));

      expect(box.length, 1);
    },
  );
}
