import 'package:flutter/material.dart';
import 'package:foodapps/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'package:foodapps/providers/auth.dart';

import 'package:foodapps/views/loading.dart';
import 'package:foodapps/views/home.dart';
import 'package:foodapps/views/login.dart';
import 'package:foodapps/views/register.dart';
import 'package:foodapps/views/password_reset.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => AuthProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Router(),
          '/login': (context) => LogIn(),
          '/register': (context) => Register(),
          '/password-reset': (context) => PasswordReset(),
          '/home': (context) => MainScreen(),
        },
      ),
    ),
  );
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Consumer<AuthProvider>(
      builder: (context, user, child) {
        switch (user.status) {
          case Status.Uninitialized:
            return Loading();
          case Status.Unauthenticated:
            return LogIn();
          //case Status.Authenticated:
          // return ChangeNotifierProvider(
          // builder: (context) => OrdersProvider(authProvider),
          // child: Orderss(),
          //);
          default:
            return LogIn();
        }
      },
    );
  }
}
