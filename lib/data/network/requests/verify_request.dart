import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/verify_request_model.dart';
import '../../data_providers/remote/dio_helper.dart';

class VerifyRequest {
  VerifyRequest._();
  static final VerifyRequest instance = VerifyRequest._();
  Future<Response> call(VerifyRequestModel verifyRequest) async {
    return await DioHelper.postData(url: otp, body: verifyRequest.toJson());
  }
}
