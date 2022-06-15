import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  void register(
  {
  required String name,
  required String email,
  required String password,
  required String phone,
  })
  async {
    emit(RegisterLoading());
    await DioHelper.postData(
        url: registerURL,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }
    ).then((value)
    {
      emit(RegisterSuccess());
    }).catchError((error)
    {
      emit(RegisterError());
    });
  }

  LoginModel? loginModel;
  void login(
      {
        required String email,
        required String password,
      })
  async {
    emit(LoginLoading());
    await DioHelper.postData(
        url: loginURL,
        body: {
          'email': email,
          'password': password,
        }
    ).then((value)
    {
      emit(LoginSuccess());
      // loginModel = LoginModel.fromJson(value.data);
    }).catchError((error)
    {
      emit(LoginError());
    });
  }



}
