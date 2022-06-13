import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';

import '../../utils/constants/strings.dart';
import '../screens/Auth/login_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case splashScreen:
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return null;
    }
  }
}
