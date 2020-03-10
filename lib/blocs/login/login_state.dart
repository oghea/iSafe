part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final User user;

  LoginSuccessState({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() {
    return 'LoginSuccess { user: $user }';
  }
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'LoginFailure { error: $error }';
  }
}

class LoginChangePasswordAlertState extends LoginState {

  @override
  List<Object> get props => [];
}
