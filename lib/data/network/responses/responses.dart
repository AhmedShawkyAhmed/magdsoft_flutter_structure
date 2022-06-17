import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/network/dio_exceptions.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

import '../../../constants/end_points.dart';

class UserRespose {
  late final String email;
  late final String password;
  late final String phone;
  late final String name;

  UserRespose();

  Future<Response> signUser(String email, String password) async {
    try {
      final Response response = await DioHelper.postData(
        url: loginEndPoint,
        body: {
          'email': email,
          'password': password,
        },
      );
      print(response.data);
      if (response.data['status'] == 200) {
        return response;
      } else {
        throw DioExceptions.fromResponse(response).toString();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Response> registerUser(
      String email, String password, String phone, String name) async {
    try {
      final Response responseCheck = await DioHelper.postData(
        url: registerEndPoint,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );
      if (responseCheck.statusCode == 200) {
        Future.delayed(const Duration(seconds: 2));
        final Response response = await DioHelper.postData(
          url: loginEndPoint,
          body: {
            'email': email,
            'password': password,
          },
        );
        return response;
      } else {
        throw DioExceptions.fromResponse(responseCheck).toString();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
