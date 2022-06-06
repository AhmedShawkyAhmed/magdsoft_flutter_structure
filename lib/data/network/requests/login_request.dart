import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

Future<Response> loginRequest({required String email, required String password})async {
  return DioHelper.postData(
    url: login,
    body: {'email': email, 'password': password},
  );
}
