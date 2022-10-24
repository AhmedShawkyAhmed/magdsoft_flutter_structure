import 'package:equatable/equatable.dart';

class VerifyRequestModel extends Equatable {
  final String code;

  const VerifyRequestModel({required this.code});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'code': code,
      'phone': 01111111111,
    };
    return map;
  }

  @override
  List<Object?> get props => [code];
}
