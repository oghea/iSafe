import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isafe/blocs/bloc_delegates.dart';
import 'package:isafe/screens/change_password_screen.dart';
import 'package:isafe/screens/home_screen.dart';
import 'package:isafe/screens/login_screen.dart';
import 'package:isafe/screens/splash_screen.dart';

import 'blocs/blocs.dart';

void main() {
  BlocSupervisor.delegate = ISafeBlocDelegate();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: ISafeApp(),
    ),
  );
}

class ISafeApp extends StatelessWidget {
  const ISafeApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // For routes testing purposes:
      initialRoute: '/',
      routes: {
        '/': (context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Unauthenticated) {
                return LoginScreen();
              } else if (state is Authenticated) {
                return HomeScreen();
              } else if (state is AuthenticatedChangePassword) {
                return ChangePasswordScreen();
              }
              return SplashScreen();
            },
          );
        },
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
