import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../widget/button.dart';

class HomeScreen extends StatelessWidget {

  final UserModel userModel ;

  const HomeScreen({Key? key,  required this.userModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context,state) {
          if(state is PostDataSuccessState){

          }
        },
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'User Data',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 125),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name : ${userModel.account![0].name} ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      'Email : ${userModel.account![0].email}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      'Phone : ${userModel.account![0].phone}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Center(
                      child: defaultButton(onPreesed: () {
                        Navigator.pushReplacementNamed(context, loginScreen);
                      }, text: 'Logout',color: AppColor.red),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
