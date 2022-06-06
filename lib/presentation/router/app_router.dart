import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_strings.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/register/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppStrings.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppStrings.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppStrings.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
