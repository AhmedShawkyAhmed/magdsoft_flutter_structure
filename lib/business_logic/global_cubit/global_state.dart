part of 'global_cubit.dart';

enum GlobalStateStatus {
  initial,
  userLoaded,
  submissionFailure,
}

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class SubmissionInProgress extends GlobalState {}

class GlobalAuthState extends GlobalState {
  final User? user;
  final GlobalStateStatus status;
  final String? errorMessage;

  GlobalAuthState({
    required this.user,
    required this.status,
    this.errorMessage,
  });

  GlobalAuthState copyWith({
    User? user,
    String? errorMessage,
  }) {
    return GlobalAuthState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status,
    );
  }

  @override
  String toString() {
    return 'GlobalAuthState{user: $user, status: $status, errorMessage: $errorMessage}';
  }
}
