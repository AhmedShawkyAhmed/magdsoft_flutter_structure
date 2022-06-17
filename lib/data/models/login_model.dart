class UserModel {
  int? status;
  String? message ;
  List<Account>? account;

  UserModel({this.status, this.account,this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'] ?? json[''];
    if (json['account'] != null) {
      account = <Account>[];
      json['account'].forEach((v) {
        account!.add(Account.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (account != null) {
      data['account'] = account!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Account(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.updatedAt,
        this.createdAt});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
