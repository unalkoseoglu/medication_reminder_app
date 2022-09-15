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
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ReminderView());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsView());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DetailView(key: args.key, reminder: args.reminder));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(TabRoute.name, path: '/', children: [
          RouteConfig(HomeRoute.name,
              path: 'home-view',
              parent: TabRoute.name,
              children: [
                RouteConfig(DetailRoute.name,
                    path: 'detail-view', parent: HomeRoute.name)
              ]),
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
class ReminderRoute extends PageRouteInfo<void> {
  const ReminderRoute() : super(ReminderRoute.name, path: '/reminder-view');

  static const String name = 'ReminderRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: 'home-view', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-view');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [DetailView]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({Key? key, required PillModel reminder})
      : super(DetailRoute.name,
            path: 'detail-view',
            args: DetailRouteArgs(key: key, reminder: reminder));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.reminder});

  final Key? key;

  final PillModel reminder;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, reminder: $reminder}';
  }
}
