class LoginModel {
  int? status;
  AccountModel? account;

  LoginModel.fromJson(Map<String, dynamic> json) {
    account = List.from(json['account'])
        .map((account) => AccountModel.fromJson(account))
        .toList()
        .first;
    status = json["status"];
  }
}

class AccountModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? createdAt;
  String? updatedAt;

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    createdAt = json["updated_at"];
    updatedAt = json["created_at"];
  }
}

class RegisterModel {
  String? message;
  int? status;
  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
  }
}
