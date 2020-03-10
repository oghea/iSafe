import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/blocs.dart';
import 'package:isafe/blocs/login/login.dart';

import 'change_password_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _login() {
      BlocProvider.of<LoginBloc>(context).add(LoginSubmittedEvent(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Success Login'),
              backgroundColor: Colors.green,
            ),
          );
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        } else if (state is LoginFailureState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginChangePasswordAlertState) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Ganti password anda terlebih dahulu'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen(),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'username'),
                    controller: _usernameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  RaisedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                  Container(
                    child: state is LoginLoadingState
                        ? CircularProgressIndicator()
                        : null,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
