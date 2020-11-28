import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_ui_app/api_calls/api_tasks.dart';
import 'package:login_ui_app/colors.dart';
import 'package:login_ui_app/models/task.dart';
import 'package:login_ui_app/screens/addTask.dart';
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
    callApi();
  }

  callApi() {
    ApiTask.getAllTasks().then((value) {
      setState(() {
        listTasks = value;
        isInAsyncCall = false;
      });
    });
  }

  TextDecoration getTextDecoration(bool completed) {
    if (completed) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
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
              itemBuilder: (BuildContext context, int index) => Slidable(
                key: Key(listTasks[index].description),
                actionExtentRatio: 0.25,
                actionPane: SlidableDrawerActionPane(),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {
                      setState(() {
                        isInAsyncCall = true;
                      });
                      ApiTask.deleteTaskbyId(listTasks[index].id).then((value) {
                        setState(() {
                          listTasks.removeAt(index);
                          isInAsyncCall = false;
                        });
                        _showSnackBar(context, ' Task Deleted');
                      });
                    },
                  ),
                ],
                child: Card(
                  child: CheckboxListTile(
                    activeColor: t3_colorPrimary,
                    title: Text(
                      listTasks[index].description,
                      style: TextStyle(
                        decoration:
                            getTextDecoration(listTasks[index].completed),
                      ),
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
        onPressed: () async {
          String added = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddTaskPage()));
          setState(() {
            isInAsyncCall = true;
          });
          callApi();
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
