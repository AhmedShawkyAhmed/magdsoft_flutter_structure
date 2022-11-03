part of 'help_cubit.dart';

abstract class HelpState extends Equatable {
  const HelpState();

  @override
  List<Object> get props => [];
}

class HelpLoading extends HelpState {}

class HelpLoaded extends HelpState {
  final List<HelpModel> helpList;

  const HelpLoaded({required this.helpList});
  @override
  List<Object> get props => [
        helpList,
      ];
}
