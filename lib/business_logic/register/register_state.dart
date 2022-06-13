part of 'register_cubit.dart';

enum RegisterStatus { initial, supmitting, success, error }

class RegisterState extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  final String phone;
  final RegisterStatus status;
  final Failure failure;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;
  const RegisterState(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phone,
      required this.status,
      required this.failure});

  factory RegisterState.initial() {
    return RegisterState(
      fullName: '',
      email: '',
      password: '',
      confirmPassword: '',
      phone: '',
      status: RegisterStatus.initial,
      failure: Failure(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        fullName,
        email,
        password,
        confirmPassword,
        phone,
        status,
        failure,
      ];

  RegisterState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    RegisterStatus? status,
    Failure? failure,
  }) {
    return RegisterState(
      fullName: '',
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      confirmPassword: '',
      phone: '',
    );
  }
}

class Failure {
  final String = '';
}

class ChangePasswordVisibility extends LoginState {
  ChangePasswordVisibility(
      {required String email,
      required String password,
      required LoginStatus status,
      required Failure failure})
      : super(
          email: email,
          password: password,
          status: status,
          failure: Failure(),
        );

  @override
  List<Object?> get props => [];
}
// class RegisterInitial extends RegisterState {
//   const RegisterInitial(
//       {required String email,
//       required String password,
//       required String status,
//       required String failure})
//       : super(
//             email: email, password: password, status: RegisterState.initial(), failure: failure);
// }
