import 'package:flutter/material.dart';
import 'package:healthkick/models/constants.dart';

Widget appBarMain(BuildContext context) {
  //todo:add logout button and change color to pink
  return AppBar(
    title:
        Constants.route == "search" ? Text("Search For Patient") : Text("Chat"),
    elevation: 0.0,
    centerTitle: false,
    backgroundColor: Colors.pink[600],
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 17);
}
