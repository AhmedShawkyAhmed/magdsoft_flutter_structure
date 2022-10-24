import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request_model.dart';
import '../../data/models/verify_request_model.dart';
import '../../data/network/responses/login_response.dart';
import '../../data/network/responses/verify_response.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial());
static AuthCubit get(context) => BlocProvider.of(context);

  login(String name, String phone) async {
    emit(LoginLoading());
    final request = LoginRequestModel(name: name, phone: phone);
    final response = await LoginResponse.instance(requestModel: request);
    if (response.status == 200) {
      emit(LoginSuccess(message: response.message));
    } else {
      emit(LoginFailed(message: response.message));
    }
  }

  verify(String code) async {
    emit(VerifyLoading());

    final request = VerifyRequestModel(code: code);
    final response = await VerifyResponse.instance(requestModel: request);
    if (response.status == 200) {
      emit(VerifySuccess(message: response.message));
    } else {
      emit(VerifyFailed(message: response.message));
    }
  }
}
