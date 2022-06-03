import 'package:dartz/dartz.dart';
import '../models/account_model.dart';
import '../models/base_model.dart';
import '../network/failure.dart';
import '../network/requests/register_request.dart';
import '../network/requests/login_request.dart';

abstract class Repository {
  Future<Either<Failure, List<Account>>> login(LoginRequest loginRequest);

  Future<Either<Failure, BaseModel>> register(RegisterRequest registerRequest);
}
