import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/models/constants.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:healthkick/services/database.dart';

class HomePageDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Center(),
          IconButton(icon: Icon(Icons.person), onPressed: () {})
        ],
        backgroundColor: Colors.pink[600],
        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: Column(
        children: [
          Text("Hello " + Constants.userName),
          RaisedButton(
            child: Text("Go to chat page"),
            onPressed: () {
              Navigator.of(context).pushNamed('/chathomescreen_doctor');
            },
          ),
          RaisedButton(
            child: Text("Create Patient Appointments"),
            onPressed: () {
              Navigator.of(context).pushNamed('/appointmentscreen');
            },
          )
        ],
      )),
    );
  }
}
