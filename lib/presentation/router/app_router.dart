import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/register/register.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String userRoute = "/user";
}

class AppRouter {
  final User? user = User.fromJson(
      jsonDecode(CacheHelper.getDataFromSharedPreference(key: "user")));
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => user == null ? LoginScreen() : UserScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/user':
        return MaterialPageRoute(builder: (_) => UserScreen());
      default:
        return null;
    }
  }
}
