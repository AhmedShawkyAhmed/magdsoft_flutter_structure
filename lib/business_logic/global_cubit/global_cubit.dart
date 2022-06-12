import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../data/remote/dio_helper.dart';
import '../../presentation/styles/GeneralComponents.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  final RegisterUserName = TextEditingController();
  final RegisterEmail = TextEditingController();
  final RegisterPassword = TextEditingController();
  final RegisterPhoneNumber = TextEditingController();
  final RegisterConfirmPassword = TextEditingController();

  final LoginEmail = TextEditingController();
  final LoginPassword = TextEditingController();


  LoginModal?loginModal;
  void Login() {
    emit(LoginLoaded());
    DioHelper.postData(url: login, body: {
      "email": LoginEmail.text,
      "password": LoginPassword.text,
    }).then((value) {
        print(value.data);
        if (value.statusCode==200){
          loginModal=LoginModal.fromJson(value.data);
          print (loginModal!.account![0].name);
          emit(LoginEnter(loginModal!));
        }
    }).catchError((error) {
      emit(LoginError());
    });


  }

  void Register() {
    emit(RegisterLoaded());
    DioHelper.postData(url: register, body: {
      "name": RegisterUserName.text,
      "email": RegisterEmail.text,
      "password": RegisterPassword.text,
      "phone": RegisterPhoneNumber.text,
      "confirmpassword": RegisterConfirmPassword.text,
    }).then((value) {
      print(value.data);
      if (value.statusCode==200){
        emit(RegisterEnter());
      }
    }).catchError((error) {
      emit(RegisterError());
    });
  }
  IconData suffixRegister = Icons.visibility_outlined;
  bool isPasswordRegister = true;

  void checkvisibilityRegister() {
    isPasswordRegister = !isPasswordRegister;
    suffixRegister =
    isPasswordRegister ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(PasswordObscureText());
  }

  IconData suffixconfiromRegister = Icons.visibility_outlined;
  bool isPasswordconfiromRegister = true;

  void checkvisibilityconfiromRegister() {
    isPasswordconfiromRegister = !isPasswordconfiromRegister;
    suffixconfiromRegister =
    isPasswordconfiromRegister ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(PasswordObscureconfiromRegisterText());
  }


  IconData suffixLogin = Icons.visibility_outlined;
  bool isPasswordLogin = true;

  void checkvisibilityLogin() {
    isPasswordLogin = !isPasswordLogin;
    suffixLogin =
    isPasswordLogin ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(PasswordObscureLoginText());
  }
  var golbalkey=GlobalKey<FormState>();
  final editProfileScaffoldKey = GlobalKey<ScaffoldState>();


  // IconData cheakSuffixIcon(context){
  //   return LoginCubit.get(context).suffix;
  // }
  // bool cheakChangeButton(context){
  //   return LoginCubit.get(context).isPassword;
  // }
  //
  // void checkvisibility(context) {
  //   LoginCubit.get(context).checkvisibility();
  // }

}

