import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isafe/repositories/user/user_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({Key key});

  @override
  ForgotPasswordState get initialState =>
      ForgotPasswordInitialState();

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    yield ForgotPasswordLoadingState();
    if (event is ForgotPasswordSubmittedEvent) {
      yield* _mapForgotPasswordSubmittedToState(
        event.username,
        event.dateOfBirth,
      );
    } else if (event is ForgotPasswordDefaultSubmittedEvent) {
      yield* _mapForgotPasswordDefaultSubmittedToState(event.password);
    } else if (event is ForgotPasswordDefaultSubmittedEvent) {
      yield* _mapForgotPasswordDefaultSubmittedToState(event.password);
    }
  }

  Stream<ForgotPasswordState> _mapForgotPasswordSubmittedToState(
    String username,
    String dateOfBirth,
  ) async* {
    if (username == '') {
      yield ForgotPasswordFailureState(error: 'Username cannot be empty');
    } else if (dateOfBirth == '') {
      yield ForgotPasswordFailureState(
        error: 'Date of birth cannot be empty',
      );
    } else if (username != '' && dateOfBirth != '') {
      try {
        final isTrue = await UserRepository().authenticateForgotPassword(
          username: username,
          dateOfBirth: dateOfBirth,
        );
        if (isTrue) {
          yield ForgotPasswordSuccessState();
        } else {
          yield ForgotPasswordFailureState(
            error: 'Forgot password error',
          );
        }
      } catch (_) {
        yield ForgotPasswordFailureState(error: 'Forgot password error');
      }
    }
  }

  Stream<ForgotPasswordState> _mapForgotPasswordDefaultSubmittedToState(
    String password,
  ) async* {
    if (password == '') {
      yield ForgotPasswordFailureState(
          error: 'Defaul Password cannot be empty');
    } else {
      yield ForgotDefaultPasswordSuccessState();
    }
  }

}
