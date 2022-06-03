import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/user_data_model.dart';

import '../../data/local/shared_repo.dart';
import '../../data/network/requests/register_request.dart';
import '../../data/repository/repository_impl.dart';
import '../../di.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final RepositoryImpl _repositoryImpl = instance<RepositoryImpl>();

  var registerObject =
      RegisterRequest(name: '', email: '', phone: '', password: '');

  setName(String name) {
    registerObject = registerObject.copyWith(name: name);
  }

  setEmail(String email) {
    registerObject = registerObject.copyWith(email: email);
  }

  setPhone(String phone) {
    registerObject = registerObject.copyWith(phone: phone);
  }

  setPassword(String password) {
    registerObject = registerObject.copyWith(password: password);
  }

  register() async {
    emit(RegisterButtonPressedState());
    (await _repositoryImpl.register(registerObject))
        .fold((failure) => {emit(RegisterErrorState(failure.message))}, (data) {
      emit(RegisterSuccessState());
      saveUserShared(UserData(
          registerObject.name, registerObject.email, registerObject.phone));
    });
  }
}
