import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/response.dart';
import 'package:retrofit/http.dart';

import '../../constants/end_points.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: baseURL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(loginPath)
  Future<AccountResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST(registerPath)
  Future<DataResponse> register(
      @Field("name") String name,
      @Field("email") String email,
      @Field("phone") String phone,
      @Field("password") String password);
}
