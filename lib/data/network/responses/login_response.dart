import '../../models/login_model.dart';

class LoginResponse extends LoginModel {
  LoginResponse({
    String? status,
    String? message,
    String? code,
  }) : super(
          code: code!,
          message: message!,
          status: status!,
        );

  factory LoginResponse.fromJson(Map<String,dynamic> json) {
    return LoginResponse(
      status: json['status'],
      code: json['code'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
