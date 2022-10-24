import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../constants/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? fadingController;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    fadingController = Tween<double>(begin: 0.2, end: 1).animate(controller!);
    controller?.repeat(reverse: true);
    goToNextScreen();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: FadeTransition(
        opacity: fadingController!,
        child: Image.asset(
          'assets/images/Layer.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void goToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {

        final user =
            CacheHelper.getDataFromSharedPreference(key: 'USER_ACCOUNT');
      // if have data push to home screen if go to register --> login screen
        Navigator.pushNamedAndRemoveUntil(
            context, user ? homeScreen : loginScreen, (route) => false);
      },
    );
  }
}
