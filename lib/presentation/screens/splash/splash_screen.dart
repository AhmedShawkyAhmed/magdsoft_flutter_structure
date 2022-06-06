import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_strings.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
          height: double.infinity,
        ),
      ),
    );
  }

  @override
  void initState() {
    _goToAfterDelayed();
    super.initState();
  }

  void _goToAfterDelayed() {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () => goToScreenAndFinish(context: context, routeName: AppStrings.login),
    );
  }
}
