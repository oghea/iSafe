import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/blocs.dart';
import 'package:isafe/blocs/forgot_password/forgot_password_bloc.dart';

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _submit() {
      final _password = _passwordController.text;
      final _confirmpassword = _confirmpasswordController.text;

      BlocProvider.of<ChangePasswordBloc>(context).add(
        ChangePasswordSubmittedEvent(
          password: _password,
          confirmpassword: _confirmpassword,
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccessState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Success'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
        ),
        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordFailureState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is ForgotPasswordSuccessState) {
              Navigator.popUntil(context, (ModalRoute.withName('/')));
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedIn(),
              );
            } 
          },
        ),
        
      ],
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirm your new password'),
                    controller: _passwordController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirm your new password'),
                    controller: _confirmpasswordController,
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
