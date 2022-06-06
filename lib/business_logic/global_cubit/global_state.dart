part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class SuccessLoginState extends GlobalState{}
class ErrorLoginState extends GlobalState{
  final String error;
  ErrorLoginState(this.error);
}

