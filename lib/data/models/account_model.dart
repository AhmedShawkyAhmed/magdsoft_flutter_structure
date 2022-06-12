class AccountModel{
  late int status;
   String? message;
    List<UserDataModel> account=[];

  AccountModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];
    if(json['account'] !=null) {
      json['account'].forEach((element) {
        account.add(UserDataModel.fromJson(element));
      });
    }
  }

}

class UserDataModel {
    late int id;
   late String name;
  late String email;
  late String phone;

  UserDataModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
}
}