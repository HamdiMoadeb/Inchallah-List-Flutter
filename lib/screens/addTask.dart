import 'package:flutter/material.dart';
import 'package:login_ui_app/api_calls/api_tasks.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../colors.dart';
import '../widgets.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  var taskController = TextEditingController();
  bool isInAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inchallah List'),
        backgroundColor: t3_colorPrimary,
      ),
      body: ModalProgressHUD(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Inchallah I will : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              t3EditTextField('Task', taskController, isPassword: false),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: T3AppButton(
                    textContent: 'Add',
                    onPressed: () {
                      setState(() {
                        isInAsyncCall = true;
                      });
                      var body = {
                        "description": taskController.text.toString(),
                      };

                      ApiTask.addNewtask(body).then((statusCode) {
                        setState(() {
                          isInAsyncCall = false;
                        });

                        if (statusCode == 201) {
                          Navigator.pop(context, 'added');
                        } else {
                          showMyDialog(
                            context,
                            'Error',
                            'Sorry something went wrong ! ',
                            () {
                              Navigator.pop(context);
                            },
                          );
                        }
                      });
                    }),
              ),
            ],
          ),
        ),
        inAsyncCall: isInAsyncCall,
        opacity: 0.1,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(t3_colorPrimary),
        ),
      ),
    );
  }
}
