// ignore: camel_case_types
class UserModel {
  int? status;
  List<User>? user;

  UserModel({this.status, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account'] != null) {
      user = <User>[];
      json['account'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['account'] = user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? updatedAt;
  String? createdAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.updatedAt,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
