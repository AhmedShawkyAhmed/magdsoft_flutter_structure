import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../di.dart';
import '../resources/strings_manager.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/shared/splash_screen.dart';
import '../screens/user/user_profile.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String userProfileRoute = "/user_profile";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.userProfileRoute:
        return MaterialPageRoute(builder: (_) => const UserProfile());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: Text(AppStrings.noRouteFound.tr())),
            body: Center(child: Text(AppStrings.noRouteFound.tr()))));
  }
}
