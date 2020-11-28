import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_ui_app/api_calls/api_auth.dart';
import 'package:login_ui_app/colors.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../utils.dart';
import '../widgets.dart';

class T3SignIn extends StatefulWidget {
  static var tag = "/T3SignIn";

  @override
  T3SignInState createState() => T3SignInState();
}

class T3SignInState extends State<T3SignIn> {
  bool passwordVisible = false;
  bool isRemember = false;
  bool isInAsyncCall = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String t3_hint_password = "Password";
  String t3_lbl_remember = "Remember";
  String t3_hint_Email = "Email";
  String t3_lbl_sign_in = "Sign In";
  String t3_lbl_sign_in_link = "Sign In";
  String t3_lbl_forgot_password = "Forgot Password?";
  String t3_lbl_welcome = "Inchallah";
  String t3_lbl_back = "List";
  String t3_lbl_don_t_have_account = "Don\'t have an account?";
  String t3_lbl_sign_up = "Sign Up";
  String t3_hint_confirm_password = "Confirm Password";
  String t3_lbl_already_have_account = "Already have an account?";

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Container(
        color: t3_white,
        height: MediaQuery.of(context).size.height,
        child: ModalProgressHUD(
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
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 45),
                  transform: Matrix4.translationValues(25, -45, 0),
                  child:
                      Image.asset('assets/todo.png', height: 100, width: 100),
                ),
                t3EditTextField('Email', emailController, isPassword: false),
                SizedBox(height: 16),
                t3EditTextField('Password', passwordController,
                    isPassword: true),
                SizedBox(height: 14),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Checkbox(
                        focusColor: t3_colorPrimary,
                        activeColor: t3_colorPrimary,
                        value: isRemember,
                        onChanged: (bool value) {
                          setState(() {
                            isRemember = value;
                          });
                        },
                      ),
                      Text(
                        'Remember',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: T3AppButton(
                      textContent: 'Sign In',
                      onPressed: () {
                        setState(() {
                          isInAsyncCall = true;
                        });
                        var body = {
                          "email": emailController.text.toString(),
                          "password": passwordController.text.toString(),
                        };

                        ApiAuth.login(body).then((response) {
                          setState(() {
                            isInAsyncCall = false;
                          });

                          if (response.statusCode == 200) {
                            // save Token
                            var body = jsonDecode(response.body);
                            String myToken = body['token'];
                            saveTokenSharedPref(myToken);

                            Navigator.pushNamed(context, '/home');
                          } else {
                            showMyDialog(
                              context,
                              'Error',
                              response.body,
                              () {
                                Navigator.pop(context);
                              },
                            );
                            print(response.body);
                          }
                        });
                      }),
                ),
                SizedBox(height: 20),
                Text('Forgot Password?', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: GestureDetector(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18.0,
                                decoration: TextDecoration.underline,
                                color: t3_colorPrimary),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
          inAsyncCall: isInAsyncCall,
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(t3_colorPrimary),
          ),
        ),
      ),
    );
  }
}
