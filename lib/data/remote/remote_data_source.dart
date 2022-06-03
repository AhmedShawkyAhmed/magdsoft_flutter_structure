import '../network/app_api.dart';
import '../network/requests/login_request.dart';
import '../network/requests/register_request.dart';
import '../network/responses/response.dart';

abstract class RemoteDataSource {
  Future<AccountResponse> login(LoginRequest loginRequest);

  Future<BaseResponse> register(RegisterRequest registerRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AccountResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<DataResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(registerRequest.name,
        registerRequest.email, registerRequest.phone, registerRequest.password);
  }
}
