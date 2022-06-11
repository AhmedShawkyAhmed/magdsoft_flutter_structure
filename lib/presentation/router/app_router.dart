import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

import '../screens/user/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return null;
    }
  }
}

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String profile = "/profile";
}
