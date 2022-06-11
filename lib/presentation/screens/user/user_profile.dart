import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/contants.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AccountModel account;
  @override
  void initState() {
    super.initState();
    account = GlobalCubit.get(context).loginModel!.account!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: kWidth,
              height: kHeight * 0.1,
              color: AppColor.primary,
              child: const Center(
                child: Text(
                  "User Data",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            const Spacer(flex: 2),
            BlocConsumer<GlobalCubit, GlobalState>(
              listener: (context, state) {},
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountText(text: "Name : ${account.name}"),
                  const SizedBox(height: 10),
                  AccountText(text: "Email : ${account.email}"),
                  const SizedBox(height: 10),
                  AccountText(text: "Phone : ${account.phone}"),
                ],
              ),
            ),
            const Spacer(flex: 5),
            AppButton(
              text: "Logout",
              backgroundColor: AppColor.red,
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.login, (route) => false),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
