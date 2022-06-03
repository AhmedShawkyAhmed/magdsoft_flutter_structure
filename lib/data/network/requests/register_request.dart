import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "password")
  final String password;

  RegisterRequest(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  RegisterRequest copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return RegisterRequest(
      name: name ?? this.email,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
