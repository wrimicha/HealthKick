import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/cupertino.dart';

//doctors appointment form.... will use database to set data for user using users email and password (maybe use the search class).
class AppointmentPage extends StatefulWidget {
  AppointmentScreen createState() => AppointmentScreen();
}

class AppointmentScreen extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Create appointments"),
      ),
      body: Column(
        children: [Text("TEST")],
      ),
    );
  }
}
