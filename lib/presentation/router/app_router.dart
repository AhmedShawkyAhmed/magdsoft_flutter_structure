import 'package:flutter/material.dart';

import '../screens/shared/splash_screen.dart';

class Routes {
  static const String splashScreenKey = '/';
  static const String loginScreenKey = '/login';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenKey:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case Routes.loginScreenKey:
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return null;
    }
  }
}