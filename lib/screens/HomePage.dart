import 'package:flutter/material.dart';
import 'package:login_ui_app/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inchallah List'),
        backgroundColor: t3_colorPrimary,
      ),
      body: Text('Welcome to Inchallah List'),
    );
  }
}
