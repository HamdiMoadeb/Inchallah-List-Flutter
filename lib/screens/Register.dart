import 'package:flutter/material.dart';

import '../colors.dart';
import '../utils.dart';
import '../widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: t3_white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height) / 3.5,
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/t3_ic_background.png',
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Inchallah',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'List',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    transform: Matrix4.translationValues(0, 20, 0),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 45),
                    transform: Matrix4.translationValues(25, -45, 0),
                    child:
                        Image.asset('assets/todo.png', height: 100, width: 100),
                  ),
                ],
              ),
              t3EditTextField('Name', isPassword: false),
              SizedBox(height: 16),
              t3EditTextField('Email', isPassword: false),
              SizedBox(height: 16),
              t3EditTextField('Password', isPassword: true),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: T3AppButton(
                    textContent: 'Sign Up',
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    }),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an account?', style: primaryTextStyle()),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: GestureDetector(
                        child: Text('Sign In',
                            style: TextStyle(
                                fontSize: 18.0,
                                decoration: TextDecoration.underline,
                                color: t3_colorPrimary)),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
