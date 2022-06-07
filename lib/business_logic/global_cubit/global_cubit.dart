import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/status_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/register_response.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {


  bool _isObscured = true;


  GlobalCubit() : super(GlobalInitial());

  AccountModel? accountModel;

  static GlobalCubit get(context) => BlocProvider.of(context);

  loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    StatusModel? statusModel =
        await loginResponse(email: email, password: password);
    if (statusModel != null) {
      log('Success ${statusModel.status}');
      switch (statusModel.status) {
        case 200:
          emit(SuccessLoginState(accounts: statusModel.accountModel));
          break;
        case 404:
          emit(ErrorLoginState(statusModel.message as String));
          break;
        default:
          emit(UnknownState());
      }
    }
    // emit(ErrorLoginState(error));
  }

  registerAccount({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async{
    emit(LoadingRegisterState());
    StatusModel? statusModel = await registerResponse(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );
    log('STATUS CODE: ${statusModel!.status}');
    if(statusModel.status == 200){
      loginWithEmailAndPassword(email: email, password: password);
    }
    else{
      emit(ErrorRegisterState(statusModel.message as String));
    }
  }

  void toggleObscureIcon(){
    _isObscured = !_isObscured;
    emit(ToggleObscureIconState());
  }

  bool get isObscured => _isObscured;
}
