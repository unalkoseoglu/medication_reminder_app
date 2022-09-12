import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:medication_reminder_app/feature/reminder/viewModel/reminder_view_nodel.dart';

import 'package:provider/provider.dart';

import 'feature/home/date/viewModel/date_view_model.dart';
import 'feature/home/viewModel/home_view_model.dart';
import 'feature/reminder/model/pill_model.dart';
import 'feature/tab/tab_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<PillModel>(PillModelAdapter());
  await Hive.openBox<PillModel>('mdsii');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => ReminderViewModel()),
      ChangeNotifierProvider(create: (_) => DateViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Medication Reminder App',
        debugShowCheckedModeBanner: false,
        home: TabView());
  }
}
