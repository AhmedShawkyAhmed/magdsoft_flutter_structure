import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String code, message;
  final int status;
  const LoginResponseModel(
      {required this.code, required this.status, required this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      code: json['code'] ?? '',
      status: json['status'],
      message: json['message'],
    );
  }

  @override
  List<Object?> get props => [code, message, status];
}
