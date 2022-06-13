import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
}
