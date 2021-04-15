import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/models/constants.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:healthkick/services/database.dart';

class HomePage extends StatelessWidget {
  final user;

  HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  String username;

  void _signOut(BuildContext context) {
    AuthenticationServices()
        .signOut()
        .then((_) => Navigator.of(context).pushNamed('/'));
  }

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
              Navigator.of(context).pushNamed('/chathomescreen_patient');
            },
          )
        ],
      )),
    );
  }
}
