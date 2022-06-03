part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalUserLoggedOutState extends GlobalState {}

class GlobalLanguageChangedState extends GlobalState {}
