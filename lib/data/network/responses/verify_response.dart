import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/models/verify_request_model.dart';
import 'package:magdsoft_flutter_structure/data/models/verify_response_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/verify_request.dart';

class VerifyResponse {
  VerifyResponse._();
  static final VerifyResponse instance = VerifyResponse._();
  Future<VerifyResponseModel> call(
      {required VerifyRequestModel requestModel}) async {
    Response response = await VerifyRequest.instance(requestModel);
    return VerifyResponseModel.fromJson(response.data);
  }
}
