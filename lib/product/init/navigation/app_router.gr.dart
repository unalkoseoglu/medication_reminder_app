// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TabView());
    },
    ReminderRoute.name: (routeData) {
      final args = routeData.argsAs<ReminderRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ReminderView(key: args.key, selectDate: args.selectDate));
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(TabRoute.name, path: '/', children: [
          RouteConfig(HomeRoute.name, path: 'home-view', parent: TabRoute.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings-view', parent: TabRoute.name)
        ]),
        RouteConfig(ReminderRoute.name, path: '/reminder-view')
      ];
}

/// generated route for
/// [TabView]
class TabRoute extends PageRouteInfo<void> {
  const TabRoute({List<PageRouteInfo>? children})
      : super(TabRoute.name, path: '/', initialChildren: children);

  static const String name = 'TabRoute';
}

/// generated route for
/// [ReminderView]
class ReminderRoute extends PageRouteInfo<ReminderRouteArgs> {
  ReminderRoute({Key? key, required DateTime selectDate})
      : super(ReminderRoute.name,
            path: '/reminder-view',
            args: ReminderRouteArgs(key: key, selectDate: selectDate));

  static const String name = 'ReminderRoute';
}

class ReminderRouteArgs {
  const ReminderRouteArgs({this.key, required this.selectDate});

  final Key? key;

  final DateTime selectDate;

  @override
  String toString() {
    return 'ReminderRouteArgs{key: $key, selectDate: $selectDate}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home-view');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-view');

  static const String name = 'SettingsRoute';
}
