import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_state.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/register_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  void userRegister(
      {required String email, required String password, required String name, required String phone,}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerScreen, body: {
      'name' : name,
      'email': email,
      'phone': phone,
      'password': password,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  bool obscure = true;
  IconData suffix = Icons.visibility_off_outlined;

  void Function()? suffixPressed() {
    obscure = !obscure;
    suffix =
    obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordState2());
  }
}
