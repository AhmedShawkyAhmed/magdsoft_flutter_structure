part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalLoginLoading extends GlobalState {}
class GlobalLoginSuccess extends GlobalState {}
class GlobalLoginError extends GlobalState {}

class GlobalChangePasswordVisibilityState extends GlobalState {}

class GlobalRegisterLoading extends GlobalState {}
class GlobalRegisterSuccess extends GlobalState {}
class GlobalRegisterError extends GlobalState {}


