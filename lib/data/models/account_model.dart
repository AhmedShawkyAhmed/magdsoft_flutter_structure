class LoginModal {
  int? status;
  List<Account>? account;

  LoginModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account'] != null) {
      account = <Account>[];
      json['account'].forEach((v) {
        account!.add(new Account.fromJson(v));
      });
    }
  }


}

class Account {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? updatedAt;
  String? createdAt;


  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }


}