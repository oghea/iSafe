import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isafe/repositories/user/user_repository.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  @override
  ChangePasswordState get initialState => ChangePasswordInitialState();

  @override
  Stream<ChangePasswordState> mapEventToState(
    ChangePasswordEvent event,
  ) async* {
    yield ChangePasswordLoadingState();
    if (event is ChangePasswordSubmittedEvent) {
      yield* _mapChangePasswordSubmittedToState(
        event.password,
        event.confirmpassword,
      );
    }

  }

  Stream<ChangePasswordState> _mapChangePasswordSubmittedToState(
    String password,
    String confirmpassword,
  ) async* {
    if (password == '') {
      yield ChangePasswordFailureState(error: 'Username cannot be empty');
    } else if (confirmpassword == '') {
      yield ChangePasswordFailureState(
        error: 'Password cannot be empty',
      );
    } else if (confirmpassword == password) {
      try {
        yield ChangePasswordSuccessState();
      } catch (_) {
        yield ChangePasswordFailureState(error: 'Forgot password error');
      }
    }
  }
}
