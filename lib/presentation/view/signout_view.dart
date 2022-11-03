import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/routers.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text('Sign Out'),
            onPressed: () {
              CacheHelper.removeData(key: 'ACCOUNT_VERIFIED');
              Navigator.pushNamed(context, loginScreen);
            }),
      ),
    );
  }
}
