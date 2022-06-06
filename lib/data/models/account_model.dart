

class AccountModel {
  final int _id;
  final String _name;
  final String _email;
  final String _password;
  final String _phone;
  final String _updatedAt;
  final String _createdAt;

  AccountModel._({
    required int id,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String updateAt,
    required String createdAt,
  })  : _id = id,
        _name = name,
        _email = email,
        _password = password,
        _phone = phone,
        _createdAt = createdAt,
        _updatedAt = updateAt;

  AccountModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _phone = json['phone'],
        _createdAt = json['created_at'],
        _updatedAt = json['updated_at'];

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  String get phone => _phone;

  String get password => _password;

  String get email => _email;

  String get name => _name;

  int get id => _id;
}
