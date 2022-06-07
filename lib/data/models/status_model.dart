import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class StatusModel{
  int? _status;
  List<AccountModel?> _accountModelList = [];
  String? _message;

  // StatusModel._();
  StatusModel.fromJson(Map<String, dynamic> json){
    _status = json['status'];
    if(json['message'] != null){
      _message = json['message'];
    }
    else if(json['account'] != null){
      List<dynamic> accounts = json['account'];
      for(var account in accounts ){
        AccountModel accountModel = AccountModel.fromJson(account);
        _accountModelList.add(accountModel);
      }
    }
  }

  int? get status => _status;

  String? get message => _message;

  List<AccountModel?> get accountModel => _accountModelList;
}