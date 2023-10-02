// ignore_for_file: no_duplicate_case_values

import 'package:flutter/cupertino.dart';
import 'package:iq_app/main.dart';
import 'package:iq_app/splash_page.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
      case AppRoutes.homePage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const HomePage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
//TODO move to diff page

abstract class AppRoutes {
  static const homePage = '/homePage';
  static const splashPage = '/splashPage';
}

class CustomCupertinoStyleNavigationRoute extends CupertinoPageRoute {
  @override
  bool get hasScopedWillPopCallback => false;

  CustomCupertinoStyleNavigationRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
