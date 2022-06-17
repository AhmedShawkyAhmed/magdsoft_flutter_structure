import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel ;

  void userLogin ({required String email ,required String password}){
    emit(PostDataLoadingState()) ;
    DioHelper.postData(url: loginScreen, body:{
      'email' : email,
      'password' : password ,
    }).then((value) {
      userModel = UserModel.fromJson(value.data) ;
      emit(PostDataSuccessState(userModel!));
    }).catchError((error){
      emit(PostDataErrorState(error.toString()));
    });
  }

  bool obscure = true;
  IconData suffix = Icons.visibility_off_outlined;

  void Function()? suffixPressed() {
    obscure = !obscure;
    suffix = obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordState());
  }
}
