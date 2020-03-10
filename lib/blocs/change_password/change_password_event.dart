part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class LoginChangePasswordEvent extends ChangePasswordEvent {
  final String newpassword;

  LoginChangePasswordEvent({
    @required this.newpassword,
  }) : assert(
          newpassword != null,
        );

  @override
  List<Object> get props => [
        newpassword,
      ];

  @override
  String toString() {
    return 'Submitted { newpassword: $newpassword }';
  }
}

class ChangePasswordSubmittedEvent extends ChangePasswordEvent {
  final String password;
  final String confirmpassword;

  ChangePasswordSubmittedEvent({
    @required this.password,
    @required this.confirmpassword,
  });

  @override
  List<Object> get props => [
        password,
        confirmpassword,
      ];

  @override
  String toString() {
    return 'ChangePasswordSubmittedEvent { password: $password, confirmpassword: $confirmpassword }';
  }
}