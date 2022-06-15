part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class RegisterLoading extends GlobalState {}
class RegisterSuccess extends GlobalState {}
class RegisterError extends GlobalState {}

class LoginLoading extends GlobalState {}
class LoginSuccess extends GlobalState {
  // final LoginModel loginModel;
  // LoginSuccess(this.loginModel);
}
class LoginError extends GlobalState {}
