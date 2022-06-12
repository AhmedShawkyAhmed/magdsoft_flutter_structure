class RegisterModel{
  late int status;
  late String message;

  RegisterModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    message=json['message'];
  }
}