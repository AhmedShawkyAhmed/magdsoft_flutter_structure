import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            child: CustomAppBar(
              title: 'User Data',
            ),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        body: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
