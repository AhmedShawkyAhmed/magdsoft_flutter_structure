import 'package:flutter/material.dart';

import '../screens/shared/splash_screen.dart';
import '../screens/user/user_profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return null;
    }
  }
}