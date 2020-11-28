import 'package:flutter/material.dart';
import 'package:login_ui_app/api_calls/api_tasks.dart';
import 'package:login_ui_app/colors.dart';
import 'package:login_ui_app/models/task.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = '';
  bool isInAsyncCall = true;
  List<Task> listTasks = [];

  @override
  void initState() {
    super.initState();
    ApiTask.getAllTasks().then((value) {
      setState(() {
        listTasks = value;
        isInAsyncCall = false;
      });
    });
  }

  TextDecoration getTextDecoration(bool value) {
    if (value) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Inchallah List'),
        backgroundColor: t3_colorPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ModalProgressHUD(
            child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              itemBuilder: (BuildContext context, int index) => Card(
                child: CheckboxListTile(
                  activeColor: t3_colorPrimary,
                  title: Text(
                    listTasks[index].description,
                    style: TextStyle(
                        decoration:
                            getTextDecoration(listTasks[index].completed)),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      listTasks[index].completed = value;
                    });
                    var body = {
                      "completed": value,
                    };
                    ApiTask.updateTaskbyId(listTasks[index].id, body);
                  },
                  value: listTasks[index].completed,
                ),
              ),
              itemCount: listTasks.length,
            ),
            inAsyncCall: isInAsyncCall,
            opacity: 0.1,
            progressIndicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(t3_colorPrimary),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiTask.getAllTasks().then((tasks) {
            print(tasks);
          });
        },
        backgroundColor: t3_colorPrimary,
        child: Icon(
          Icons.playlist_add_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
