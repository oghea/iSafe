import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/blocs.dart';
import 'package:isafe/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:isafe/screens/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: Column(
          children: <Widget>[
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
