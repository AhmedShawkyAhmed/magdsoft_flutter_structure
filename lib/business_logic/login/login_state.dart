// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

enum LoginStatus { initial, supmitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginState status;
  final Failure failure;
  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      required this.failure});

  factory LoginStatus.initial() {
    return LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
      failure: Failure(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password, status, failure];

  LoginState copyWith({
    String? email,
    String? password,
    LoginState? status,
    Failure? failure,
  }) {
    return LoginState(
      email ?? this.email,
      password ?? this.password,
      status ?? this.status,
      failure ?? this.failure,
    );
  }
}

class Failure {
  // failure class
}

// class LoginInitial extends LoginState {
//   const LoginInitial(
//       {required String email,
//       required String password,
//       required String status,
//       required String failure})
//       : super(
//             email: email, password: password, status: LoginState.initial(), failure: failure);
// }
