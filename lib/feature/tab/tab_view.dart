import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:medication_reminder_app/product/init/navigation/app_router.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [HomeRoute(), SettingsRoute()],
      builder: (context, child, tabController) => Scaffold(
          body: child,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(const ReminderRoute());
            },
            child: const Icon(
              Icons.alarm_add_rounded,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.tabsRouter.activeIndex,
            onTap: context.tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting'),
            ],
          )),
    );
  }
}



/* class TabView extends StatelessWidget {
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
 */