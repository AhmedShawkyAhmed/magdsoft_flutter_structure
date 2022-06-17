import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/dio_exceptions.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

import '../../../constants/end_points.dart';

class UserRespose {
  final User user;
  UserRespose({required this.user});

  Future<Response> signUser(User user) async {
    try {
      final Response response = await DioHelper.postData(
        url: loginEndPoint,
        body: {
          'email': user.email,
          'password': user.password,
        },
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioExceptions.fromResponse(response).toString();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<Response> registerUser(User user) async {
    try {
      final Response response = await DioHelper.postData(
        url: loginEndPoint,
        body: {
          'email': user.email,
          'password': user.password,
          'phone': user.phone,
        },
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioExceptions.fromResponse(response).toString();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
