import 'package:equatable/equatable.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class VerifyResponseModel extends Equatable {
  final String message;
  final int status;
  final AccountModel accountModel;

  const VerifyResponseModel(
      {required this.message,
      required this.status,
      required this.accountModel});

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyResponseModel(
      message: json['message'],
      status: json['status'],
      accountModel: AccountModel.fromJson(json['account'] ?? {}),
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        accountModel,
      ];
}
