part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  final String username;
  final String password;

  LoginSubmittedEvent({
    @required this.username,
    @required this.password,
  }) : assert(
          username != null,
          password != null,
        );

  @override
  List<Object> get props => [
        username,
        password,
      ];

  @override
  String toString() {
    return 'Submitted { username: $username, password: $password }';
  }
}

class LoginChangePasswordInitialEvent extends LoginEvent {}

