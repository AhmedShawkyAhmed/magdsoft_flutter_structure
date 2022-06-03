import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/network/requests/login_request.dart';
import '../../data/local/shared_repo.dart';
import '../../data/models/user_data_model.dart';
import '../../data/repository/repository_impl.dart';
import '../../di.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final RepositoryImpl _repositoryImpl = instance<RepositoryImpl>();

  String? _email, _password;

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  login() async {
    emit(LoginButtonPressedState());

    (await _repositoryImpl
            .login(LoginRequest(_email.toString(), _password.toString())))
        .fold((failure) {
      emit(LoginErrorState(failure.message));
    }, (data) {
      emit(LoginSuccessState());
      // Index 0 because we deliver the account from the API as a list of accounts
      saveUserShared(UserData(data[0].name, data[0].email, data[0].phone));
    });
  }

}