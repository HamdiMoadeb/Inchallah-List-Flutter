import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui_app/screens/HomePage.dart';
import 'package:login_ui_app/screens/Register.dart';

import 'screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => T3SignIn(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
