import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';

import '../../constants/end_points.dart';
import '../../data/models/login_model.dart';
import '../screens/user/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case homeScreen:
        final userModel = settings.arguments as UserModel ;
        return MaterialPageRoute(builder: (_) =>  HomeScreen(userModel: userModel,));
      default:
        return null;
    }
  }
}