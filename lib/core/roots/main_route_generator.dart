import 'package:flutter/cupertino.dart';
import 'package:iq_app/core/roots/app_routes.dart';
import 'package:iq_app/core/roots/custom_cupertino_route.dart';
import 'package:iq_app/home_page/home_page.dart';
import 'package:iq_app/sign_in_page/sign_in_page.dart';
import 'package:iq_app/splash_page/splash_page.dart';

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
      case AppRoutes.signin:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignInPage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
