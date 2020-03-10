import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/blocs.dart';
import 'package:isafe/screens/forgot_password_screen.dart';
import 'package:isafe/screens/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: Column(
            children: <Widget>[
              LoginForm(),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text('Forget Password'),
              )
            ],
          ),
        ));
  }
}
