abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginButtonPressedState extends LoginStates {}

class LoginSuccessState extends LoginStates {
}

class LoginErrorState extends LoginStates {
  final String message;

  LoginErrorState(this.message);
}
