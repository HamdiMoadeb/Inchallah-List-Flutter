import 'package:flutter/material.dart';

import 'colors.dart';
import 'utils.dart';

Padding t3EditTextField(var hintText, {isPassword = true}) {
  return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextFormField(
        style: TextStyle(fontSize: 18),
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
          hintText: hintText,
          filled: true,
          fillColor: t3_edit_background,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: t3_edit_background, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: t3_edit_background, width: 0.0),
          ),
        ),
      ));
}

class T3AppButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  T3AppButton({@required this.textContent, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return T3AppButtonState();
  }
}

class T3AppButtonState extends State<T3AppButton> {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        onPressed: widget.onPressed,
        textColor: t3_white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              t3_colorPrimary,
              t3_colorPrimaryDark,
            ]),
            borderRadius: BorderRadius.all(
              Radius.circular(80.0),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

// ignore: must_be_immutable
class T3AppBar extends StatefulWidget {
  var titleName;

  T3AppBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return T3AppBarState();
  }
}

class T3AppBarState extends State<T3AppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: t3_white,
                  onPressed: () {
                    //finish(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Center(
                    child: Text(
                      widget.titleName,
                      maxLines: 2,
                      style: boldTextStyle(size: 22, color: t3_white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              // child: CircleAvatar(
              //   backgroundImage:Image,
              //   radius: 16,
              // ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.only(left: 16.0, right: 16),
    child: Divider(
      color: t3_view_color,
      height: 16,
    ),
  );
}
