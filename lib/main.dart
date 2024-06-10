import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homework/homework1/utils/routes.dart';
import 'homework/homework1/views/screens/home_screen.dart';
import 'homework/homework1/views/screens/login.dart';
import 'homework/homework1/views/screens/register.dart';
import 'homework/homework1/views/screens/reset_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return CupertinoPageRoute(
          builder: (BuildContext context) => HomeScreen(

          ),
        );
      case RouteNames.register:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const RegisterScreen(),
        );
      case RouteNames.login:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RouteNames.resetPassword:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const ResetPasswordScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
    }
  }
}