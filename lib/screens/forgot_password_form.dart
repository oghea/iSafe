import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:isafe/screens/change_password_screen.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ForgotPasswordBloc _forgotPasswordBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _submit() {
      final _username = _usernameController.text;
      final _dateOfBirth = _dateOfBirthController.text;

      BlocProvider.of<ForgotPasswordBloc>(context).add(
        ForgotPasswordSubmittedEvent(
          username: _username,
          dateOfBirth: _dateOfBirth,
        ),
      );
    }

    _login() {
      final _password = _passwordController.text;

      BlocProvider.of<ForgotPasswordBloc>(context).add(
        ForgotPasswordDefaultSubmittedEvent(password: _password),
      );
    }

    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordFailureState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          ));
        } else if (state is ForgotPasswordSuccessState) {
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  constraints: BoxConstraints(maxHeight: 150),
                  child: Column(
                    children: <Widget>[
                      Text('Please Login with Your Default Password'),
                      TextFormField(
                        controller: _passwordController,
                      ),
                      RaisedButton(
                        onPressed: _login,
                        child: Text('Login'),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ForgotDefaultPasswordSuccessState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangePasswordScreen(),
            ),
          );
        }
      },
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter your username'),
                    controller: _usernameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter your date of birth'),
                    controller: _dateOfBirthController,
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text('Submit'),
                  ),
                  Container(
                    child: state is ForgotPasswordLoadingState
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
