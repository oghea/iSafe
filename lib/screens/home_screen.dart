import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/blocs.dart';
import 'package:isafe/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _logOut() async {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          return LoginScreen();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            ),
          ],
        ),
        body: Container(
          child: Text('This is Home screen'),
        ),
      ),
    );
  }
}
