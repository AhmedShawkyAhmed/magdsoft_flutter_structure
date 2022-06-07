import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/status_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
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
}
