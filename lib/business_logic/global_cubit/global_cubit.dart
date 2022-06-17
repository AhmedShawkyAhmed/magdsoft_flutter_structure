import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/network/dio_exceptions.dart';

import '../../data/models/account_model.dart';
import '../../data/network/responses/responses.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  final UserRespose _userRespose = UserRespose();

  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    emit(SubmissionInProgress());
    try {
      Response response = await _userRespose.signUser(email, password);
      if (response.data.values.last is List) {
        User user = User.fromJson(response.data["account"].first);
        emit(GlobalAuthState(user: user, status: GlobalStateStatus.userLoaded));
      }
    } on DioExceptions catch (e) {
      emit(GlobalAuthState(
          status: GlobalStateStatus.submissionFailure,
          user: null,
          errorMessage: e.toString()));
    } catch (_) {
      emit(GlobalAuthState(
          status: GlobalStateStatus.submissionFailure,
          user: null,
          errorMessage: _.toString()));
    }
  }

  Future<void> registerWithEmailAndPasswordAndPhone(
      String email, String password, String phone, String name) async {
    emit(SubmissionInProgress());
    try {
      Response response =
          await _userRespose.registerUser(email, password, phone, name);
      if (response.data.values.last is List) {
        User user = User.fromJson(response.data["account"].first);
        emit(GlobalAuthState(user: user, status: GlobalStateStatus.userLoaded));
      } else {
        emit(GlobalAuthState(
            status: GlobalStateStatus.submissionFailure,
            user: null,
            errorMessage:
                'Email and Password are registed before but you entered them wrong'));
      }
    } on DioExceptions catch (e) {
      emit(GlobalAuthState(
          status: GlobalStateStatus.submissionFailure,
          user: null,
          errorMessage: e.toString()));
    }
  }
}
