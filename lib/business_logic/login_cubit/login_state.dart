import 'package:magdsoft_flutter_structure/data/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class PostDataLoadingState extends LoginStates {}
class PostDataSuccessState extends LoginStates {
  final UserModel userModel ;
  PostDataSuccessState(this.userModel) ;
}
class PostDataErrorState extends LoginStates {
  final error ;
  PostDataErrorState(this.error);

}

class ChangePasswordState extends LoginStates {}