import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  final String name, phone;
  const LoginRequestModel({required this.name, required this.phone});
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'phone': phone,
    };
    return map;
  }

  @override
  List<Object?> get props => [name, phone];
}
