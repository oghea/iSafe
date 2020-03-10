part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordFailureState extends ChangePasswordState {
  final String error;

  ChangePasswordFailureState({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'LoginFailure { error: $error }';
  }
}
