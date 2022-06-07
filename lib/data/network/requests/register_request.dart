import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

Future<Response> registerRequest({
  required String name,
  required String email,
  required String password,
  required String phone,
}) {
  return DioHelper.postData(
    url: login,
    body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    },
  );
}
