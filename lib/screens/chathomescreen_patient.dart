import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:healthkick/services/database.dart';

class ChatHomePatient extends StatelessWidget {
  final user;

  const ChatHomePatient({Key key, this.user}) : super(key: key);

  void _signOut(BuildContext context) {
    AuthenticationServices()
        .signOut()
        .then((_) => Navigator.of(context).pushNamed('/loginscreen'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          Center(
              child: Text(
            "Logout",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          )),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _signOut(context);
              })
        ],
        backgroundColor: Colors.pink[600],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [Text("Patient's page")],
      ),
    );
  }
}
