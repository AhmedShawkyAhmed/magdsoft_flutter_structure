import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/login_request_model.dart';

class LoginRequest {
  LoginRequest._();
  static final LoginRequest instance = LoginRequest._();
  Future<Response> call(LoginRequestModel requestModel) async {
    return await DioHelper.postData(
        url: verifyPhone, body: requestModel.toMap());
  }
}
