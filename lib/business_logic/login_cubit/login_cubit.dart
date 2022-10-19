import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/models/login_model.dart';
import '../../data/network/requests/login_request.dart';
import '../../data/network/responses/login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login(LoginRequest request) async {
    try {
      emit(LoginLoadingState());
      final response = await DioHelper.postData(
        url: verifyPhoneEndPoint,
        body: {
          'name': request.name,
          'phone': request.phone,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        if (loginResponse.status == '200') {
          emit(LoginSucessState(loginResponse));
        } else {
          emit(LoginFailureState(loginResponse.message));
        }
      }
    } on DioError {
      debugPrint('error from dio');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
