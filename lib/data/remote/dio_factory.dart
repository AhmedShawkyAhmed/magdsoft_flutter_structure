import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/app_constants.dart';

import '../../constants/end_points.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: AppConstants.token,
      DEFAULT_LANGUAGE: 'en'
    };

    dio.options = BaseOptions(
        baseUrl: baseURL,
        headers: headers,
        receiveTimeout: AppConstants.apiTimeOut,
        sendTimeout: AppConstants.apiTimeOut);

    return dio;
  }
}
