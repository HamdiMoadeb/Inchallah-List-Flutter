import 'package:flutter/material.dart';
import 'package:login_ui_app/api_calls/api_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../colors.dart';
import '../utils.dart';
import '../widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  bool isInAsyncCall = false;

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset('assets/todo.png',
                          height: 100, width: 100),
                    ),
                  ],
                ),
                t3EditTextField('Name', nameController, isPassword: false),
                SizedBox(height: 16),
                t3EditTextField('Email', emailController, isPassword: false),
                SizedBox(height: 16),
                t3EditTextField('Password', passwordController,
                    isPassword: true),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: T3AppButton(
                      textContent: 'Sign Up',
                      onPressed: () {
                        setState(() {
                          isInAsyncCall = true;
                        });
                        var body = {
                          "name": nameController.text.toString(),
                          "email": emailController.text.toString(),
                          "password": passwordController.text.toString(),
                          "age": 99
                        };

                        ApiAuth.register(body).then((response) {
                          setState(() {
                            isInAsyncCall = false;
                          });

                          if (response.statusCode == 201) {
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
