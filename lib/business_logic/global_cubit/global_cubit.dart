import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isConfirmNewPassword = true;
  IconData passwordSuffix = Icons.visibility;
  IconData confirmPasswordSuffix = Icons.visibility;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    passwordSuffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  void changeConfirmNewPasswordVisibility() {
    isConfirmNewPassword = !isConfirmNewPassword;
    confirmPasswordSuffix =
        isConfirmNewPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginUrl, body: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.data["status"] == 200) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel!));
      } else {
        emit(LoginErrorState(value.data["message"]));
      }
    }).catchError((error) {
      emit(LoginErrorState(error));
    });
  }

  RegisterModel? registerModel;
  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerUrl, body: {
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      if (registerModel != null && registerModel!.status == 200) {
        emit(RegisterSuccessState(registerModel!));
        userLogin(
          email: email,
          password: password,
        );
      } else {
        emit(RegisterErrorState(registerModel!));
      }
    }).catchError((error) {
      emit(RegisterErrorState(registerModel!));
    });
  }
}
