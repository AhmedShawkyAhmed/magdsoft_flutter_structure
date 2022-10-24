import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String name, phone;
  final int id;

  const AccountModel(
      {required this.name, required this.phone, required this.id});

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id':id,
      'name':name,
      'phone':phone,
    };

    return map;
  }

  @override
  List<Object?> get props => [name, phone, id];
}
