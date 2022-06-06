import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/constants/app_strings.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/curved_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_field.dart';
import 'package:magdsoft_flutter_structure/utils/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mediumPersianBlue,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RotatedBox(
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
                        child: CurvedContainer(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomTextField(
                                  hint: 'Email',
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                CustomTextField(
                                  hint: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove_red_eye,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        textButton: 'Register',
                                        onPressed: () {
                                          goToScreenAndFinish(context: context, routeName: AppStrings.register);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 38,
                                    ),
                                    Expanded(
                                      child: CustomButton(
                                        textButton: 'Login',
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PositionedDirectional(
                    end: 21,
                    top: 27,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.white,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'عربي',
                        style: TextStyle(
                          color: AppColor.mediumPersianBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
