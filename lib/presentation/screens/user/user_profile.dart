import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('User Data')),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: DEFAULT_COLOR,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 80.0, bottom: 70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 80.0),
                    child: Text(
                      'Name : ${cubit.accountModel!.account[0].name}',
                      style:
                          const TextStyle(color: DEFAULT_COLOR, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 80.0),
                    child: Text(
                      'Email : ${cubit.accountModel!.account[0].email}',
                      style:
                          const TextStyle(color: DEFAULT_COLOR, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 80.0),
                    child: Text(
                      'Phone : ${cubit.accountModel!.account[0].phone}',
                      style:
                          const TextStyle(color: DEFAULT_COLOR, fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: defaultButton(
                      onPressed: () {
                        navigateAndFinish(context, const LoginScreen());
                      },
                      text: 'LogOut',
                      width: 110.0,
                      height: 50.0,
                      backgroundColor: const Color.fromRGBO(173, 0, 47, 1),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
