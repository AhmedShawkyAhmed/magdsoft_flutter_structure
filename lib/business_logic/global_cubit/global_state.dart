part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoadingLoginState extends GlobalState {}

class SuccessLoginState extends GlobalState {
  final List<AccountModel?> _accounts;

  SuccessLoginState({required List<AccountModel?> accounts})
      : _accounts = accounts;

  List<AccountModel?> get getAccounts=> _accounts;
}

class ErrorLoginState extends GlobalState {
  final String error;

  ErrorLoginState(this.error);
}

class UnknownState extends GlobalState{}
