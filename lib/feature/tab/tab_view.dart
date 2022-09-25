import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/feature/home/viewModel/home_view_model.dart';
import 'package:medication_reminder_app/product/init/lang/locale_keys.g.dart';

import 'package:medication_reminder_app/product/init/navigation/app_router.dart';
import 'package:provider/provider.dart';

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
              context.router.push(ReminderRoute(
                  selectDate: Provider.of<HomeViewModel>(context, listen: false)
                      .selectDate));
            },
            child: const Icon(Icons.alarm_add_rounded),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.tabsRouter.activeIndex,
            onTap: context.tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: LocaleKeys.home_title.tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: LocaleKeys.settings_title.tr()),
            ],
          )),
    );
  }
}
