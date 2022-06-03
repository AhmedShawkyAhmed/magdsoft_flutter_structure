import 'package:dartz/dartz.dart';
import 'package:magdsoft_flutter_structure/data/models/base_model.dart';
import '../mapper/mapper.dart';
import '../../constants/extensions.dart';
import '../models/account_model.dart';
import '../remote/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/requests/login_request.dart';
import '../network/requests/register_request.dart';
import '../network/network_info.dart';
import 'repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<Account>>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ResponseCode.SUCCESS) {
          return Right(response.account.toDomain());
        } else {
          return Left(Failure(response.status.orZero(),
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, BaseModel>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status.orZero(),
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
