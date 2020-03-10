import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/blocs.dart';
import 'package:isafe/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:isafe/screens/change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ForgotPasswordBloc>(
            create: (context) => ForgotPasswordBloc(),
          ),
          BlocProvider<ChangePasswordBloc>(
            create: (context) => ChangePasswordBloc(),
          ),
        ],
        child: Container(
          child: ChangePasswordForm(),
        ),
      ),
    );
  }
}
