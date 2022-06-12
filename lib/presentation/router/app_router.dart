import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
       case '/':
         return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return null;
    }
  }
}