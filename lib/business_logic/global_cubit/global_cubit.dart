import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/register_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);


  AccountModel? accountModel;
  void login(String email,String password){
    emit(GlobalLoginLoading());
    DioHelper.postData(url: LOGIN, body: {
      'email':email,
      'password':password
    }).then((value){
      accountModel=AccountModel.fromJson(value.data);
      emit(GlobalLoginSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GlobalLoginError());
    });
  }

  RegisterModel? model;
  void register(String email,String password,String name,String phone,){
    emit(GlobalRegisterLoading());
    DioHelper.postData(url: REGISTER, body: {
      'email':email,
      'password':password,
      'name':name,
      'phone':phone,
    }).then((value){
      model=RegisterModel.fromJson(value.data);
      print(model!.message);
      emit(GlobalRegisterSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GlobalRegisterError());
    });
  }

  bool isVisible=true;
  IconData suffix=Icons.visibility_off;

  void changePasswordVisibility(){
    isVisible = !isVisible;
    isVisible ? suffix=Icons.visibility_off : suffix=Icons.visibility;
    emit(GlobalChangePasswordVisibilityState());
  }

  bool isConfirmVisible=true;
  IconData suffixConfirm=Icons.visibility_off;

  void changeConfirmPasswordVisibility(){
    isConfirmVisible = !isConfirmVisible;
    isConfirmVisible ? suffixConfirm=Icons.visibility_off : suffixConfirm=Icons.visibility;
    emit(GlobalChangePasswordVisibilityState());
  }

}
