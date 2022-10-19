part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSucessState extends LoginState {
  final LoginModel data;
  LoginSucessState(this.data);
}

class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(this.message);
}
