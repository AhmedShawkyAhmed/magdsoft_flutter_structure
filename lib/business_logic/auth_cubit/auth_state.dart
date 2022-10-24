part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthCubitInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailed extends AuthState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}

class LoginSuccess extends AuthState {
  final String message;

  const LoginSuccess({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}

class VerifyLoading extends AuthState {}

class VerifyFailed extends AuthState {
  final String message;

  const VerifyFailed({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}

class VerifySuccess extends AuthState {
  final String message;

  const VerifySuccess({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
