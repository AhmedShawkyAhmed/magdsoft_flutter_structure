import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_bar.dart';

import '../../../data/models/account_model.dart';
import '../../../data/network/responses/responses.dart';

class UserScreen extends StatelessWidget {
  UserRespose _userRespose = UserRespose(user: userTest1);
  void test(){
    _userRespose.signUser(userTest1);
  }
  UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    test();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            child: CustomAppBar(
              title: 'User Data',
            ),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
