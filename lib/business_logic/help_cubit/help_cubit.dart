import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';

import '../../data/network/responses/help_response.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpLoading());
static HelpCubit get(context) => BlocProvider.of(context);
  getHelpData() async {
    final response = await HelpResponse.instance();
    emit(HelpLoaded(helpList: response));
  }
}
