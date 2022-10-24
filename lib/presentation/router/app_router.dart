import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/auth_cubit/auth_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_cubit/help_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/routers.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/auth/verify_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/auth/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/product_screen.dart';
import '../../business_logic/products_cubit/products_cubit.dart';
import '../screens/shared/splash_screen.dart';
import '../screens/user/help_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<AuthCubit>(
                  create: (context) => AuthCubit(),
                  child: const LoginScreen(),
                ));
      case verifyScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: settings.arguments as AuthCubit,
                  child: VerifyScreen(),
                ));
      case helpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HelpCubit()..getHelpData(),
            child: const HelpScreen(),
          ),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => BottomBarNavigatorCubit(),
            ),
            BlocProvider<ProductsCubit>(
              create: (context) => ProductsCubit()..getProducts(),
            )
          ], child: const HomeScreen()),
        );
      case productScreen:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductScreen(
            productModel: product,
          ),
        );
      default:
        return null;
    }
  }
}
