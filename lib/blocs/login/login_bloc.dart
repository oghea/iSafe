import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isafe/models/user/user.dart';
import 'package:isafe/repositories/user/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc({Key key});

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSubmittedEvent) {
      yield LoginLoadingState();

      yield* _mapSubmittedToState(event.username, event.password);
    } 
  }

  Stream<LoginState> _mapSubmittedToState(String username, String password) async* {
    if (username == '') {
      yield LoginFailureState(error: 'Username cannot be empty');
    } else if (password == '') {
      yield LoginFailureState(error: 'Password cannot be empty');
    } else if (username != '' && password != '') {
      try {
        final User user = await UserRepository().signIn(username: username, password: password);
        if(user.isChangePassword) {
          await UserRepository().persistToken(user.token);
          yield LoginSuccessState(user: user);
        } else {
          
          yield LoginChangePasswordAlertState();
        }
      } catch (_) {
        yield LoginFailureState(error: 'Login Failed');
      }
    }
  }
}
