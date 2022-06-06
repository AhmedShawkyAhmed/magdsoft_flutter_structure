import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mediumPersianBlue,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: const RotatedBox(
                quarterTurns: 1,
                child: Image(
                  image: Svg(
                    'assets/images/flutter_logo.svg',
                    size: Size(160, 160),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(52),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomTextField(
                        hint: 'Email',
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      CustomTextField(
                        hint: 'Password',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
