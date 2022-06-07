import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_strings.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/utils/navigation.dart';

class HomeScreen extends StatelessWidget {
  final List<AccountModel?> _accounts;

  const HomeScreen({Key? key, required List<AccountModel?> account})
      : _accounts = account,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountModel userInfo = _accounts[0] as AccountModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mediumPersianBlue,
        centerTitle: true,
        title: const Text('User Data'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 144,
            ),
             Text(
              'Name: ${userInfo.name}',
            ),
            Text(
              'Email: ${userInfo.email}',
            ),
            Text(
              'Phone: ${userInfo.phone}',
            ),
            const Spacer(),
            SizedBox(
              height: 51,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.mediumPersianBlue,
                ),
                onPressed: (){
                  goToScreenAndFinish(context: context, routeName: AppStrings.login);
                },
                child: const Text(
                  'Logout',
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
