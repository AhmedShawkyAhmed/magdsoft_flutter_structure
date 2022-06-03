import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'splash_states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(InitialSplashStates());

  static SplashCubit get(context) => BlocProvider.of(context);

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => emit(LoadedSplashStates()));
  }
}
