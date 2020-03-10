part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {}

class ForgotDefaultPasswordSuccessState extends ForgotPasswordState {}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String error;

  ForgotPasswordFailureState({
    @required this.error,
  }) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'ForgotChangePasswordFailureState{ error: $error }';
  }
}
