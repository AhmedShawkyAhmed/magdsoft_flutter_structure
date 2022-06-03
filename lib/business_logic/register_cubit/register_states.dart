abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterButtonPressedState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String message;

  RegisterErrorState(this.message);
}
