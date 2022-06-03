import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/shared_repo.dart';
import '../../data/models/user_data_model.dart';
import '../../presentation/resources/language_manager.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  UserData getUserData() {
    return getUserFromShared();
  }

  void logOut() async {
    emit(GlobalUserLoggedOutState());
    deleteUser();
  }

  changeLanguagePressed() async {
    await LanguageManager.changeAppLanguage();
    emit(GlobalLanguageChangedState());
  }
}
