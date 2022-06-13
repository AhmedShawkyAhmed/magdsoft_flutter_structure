// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:magdsoft_flutter_structure/presentation/screens/Auth/login_screen.dart';
// import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:splashscreen/splashscreen.dart';

// class KSplashScreen extends StatefulWidget {
//   @override
//   _KSplashScreenState createState() => _KSplashScreenState();
// }

// Future<String> getToken() async {
//   final prefs = await SharedPreferences.getInstance();
//   if (prefs != null) {
//     String? accountToken = prefs.getString("accountToken");
//     prefs.clear();
//     return (accountToken!);
//   } else {
//     return '';
//   }
// }

// class _KSplashScreenState extends State<KSplashScreen> {
//   String res = '';
//   @override
//   void initState() {
//     super.initState();

//     getToken().then((val) {
//       setState(() {
//         if (val != '' || val != null) {
//           res = val;
//         }
//       });
//     });
//   }

//   Widget _SplashScreenFunc(Widget backward) {
//     return SplashScreen(
//       seconds: 3,
//       navigateAfterSeconds: backward,
//       backgroundColor: AppColors.backgoundColor,
//       image: Image.asset('assets/images/logo1.png'),
//       styleTextUnderTheLoader: TextStyle(),
//       loaderColor: Colors.white,
//       photoSize: 100.0,
//     );
//   }

//   Widget build(BuildContext context) {
// //
//     return res == null
//         ? _SplashScreenFunc(LoginScreen())
//         : _SplashScreenFunc(Container(color: AppColors.backgoundColor));
//   }
// }
