import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';
import 'package:medication_reminder_app/feature/reminder/view/reminder_view.dart';
import 'package:medication_reminder_app/feature/tab/model/tab_model.dart';

class TabView extends StatelessWidget {
  TabView({Key? key}) : super(key: key);
  final _items = TabModels.create().tabItems;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _items.length,
        child: Scaffold(
          body: TabBarView(children: _items.map((e) => e.page).toList()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReminderView()));
            },
            child: Icon(
              Icons.alarm_add_rounded,
              size: 30.h,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: Colors.white,
              child: TabBar(
                  indicator:
                      const UnderlineTabIndicator(borderSide: BorderSide.none),
                  padding: const EdgeInsets.all(2),
                  tabs: _items
                      .map((e) => Tab(
                            icon: Icon(
                              e.icon,
                              color: Colors.blue,
                              size: 30.h,
                            ),
                          ))
                      .toList())),
        ));
  }
}
