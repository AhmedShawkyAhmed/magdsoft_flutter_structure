import 'package:magdsoft_flutter_structure/data/models/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {
  final RegisterModel registerModel ;
  RegisterSuccessState(this.registerModel) ;
}
class RegisterErrorState extends RegisterStates {
  final error ;
  RegisterErrorState(this.error);

}

class ChangePasswordState2 extends RegisterStates {}