class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.updatedAt,
    required this.createdAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String password;
  late final String phone;
  late final String updatedAt;
  late final String createdAt;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}