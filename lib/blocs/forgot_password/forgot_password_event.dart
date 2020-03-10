part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordSubmittedEvent extends ForgotPasswordEvent {
  final String username;
  final String dateOfBirth;

  ForgotPasswordSubmittedEvent({
    @required this.username,
    @required this.dateOfBirth,
  });

  @override
  List<Object> get props => [
        username,
        dateOfBirth,
      ];

  @override
  String toString() {
    return 'ForgotPasswordSubmittedEvent { username: $username, dateOfBirth: $dateOfBirth }';
  }
}

class ForgotPasswordDefaultSubmittedEvent extends ForgotPasswordEvent {
  final String password;

  ForgotPasswordDefaultSubmittedEvent({
    @required this.password,
  });

  @override
  List<Object> get props => [
        password,
      ];

  @override
  String toString() {
    return 'ForgotPasswordDefaultSubmittedEvent { password: $password }';
  }
}

