import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication_reminder_app/feature/home/model/pill_model.dart';

import 'package:medication_reminder_app/feature/home/view/home_view.dart';
import 'package:provider/provider.dart';

import 'feature/home/viewModel/home_view_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<PillModel>(PillModelAdapter());
  var box = await Hive.openBox<PillModel>('medici');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
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
        home: HomeView());
  }
}
