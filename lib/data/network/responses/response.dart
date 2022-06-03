import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class AccountDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "created_at")
  String? createdAt;

  AccountDataResponse(this.id, this.name, this.email, this.password, this.phone,
      this.updatedAt, this.createdAt);

  factory AccountDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataResponseToJson(this);
}

@JsonSerializable()
class AccountResponse extends BaseResponse {
  @JsonKey(name: 'account')
  List<AccountDataResponse>? account;

  AccountResponse(this.account);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);
}

@JsonSerializable()
class DataResponse extends BaseResponse {
  DataResponse();

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
