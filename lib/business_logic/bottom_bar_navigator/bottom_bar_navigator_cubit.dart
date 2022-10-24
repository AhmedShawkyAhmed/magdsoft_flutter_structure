import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/view/favorite_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/notification_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/settings_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/signout_view.dart';
part 'bottom_bar_navigator_state.dart';

class BottomBarNavigatorCubit extends Cubit<BottomBarNabigatorState> {
  BottomBarNavigatorCubit() : super(BottomBarNabigatorState());

  void navigateToScreen(int index) {
    emit(state.copyWith(index));
  }
}
