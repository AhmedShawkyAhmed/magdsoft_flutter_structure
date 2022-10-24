import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(TabBarInitial());
}
