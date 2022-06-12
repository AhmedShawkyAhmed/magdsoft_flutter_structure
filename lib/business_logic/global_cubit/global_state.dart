part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class RegisterLoaded extends GlobalState {}

class RegisterEnter extends GlobalState {}

class RegisterError extends GlobalState {}

class LoginLoaded extends GlobalState {}

class LoginEnter extends GlobalState {
  final LoginModal loginModal;
  LoginEnter(this.loginModal);
}

class LoginError extends GlobalState {}

class PasswordObscureText extends GlobalState{}

class PasswordObscureconfiromRegisterText extends GlobalState{}

class PasswordObscureLoginText extends GlobalState{}