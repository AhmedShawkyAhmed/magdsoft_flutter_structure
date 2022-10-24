import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/models/login_request_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';

import '../../models/login_response_model.dart';

class LoginResponse {
  LoginResponse._();
  static final LoginResponse instance = LoginResponse._();
  Future<LoginResponseModel> call(
      {required LoginRequestModel requestModel}) async {
    Response response = await LoginRequest.instance(requestModel);
    return LoginResponseModel.fromJson(response.data);
  }
}
