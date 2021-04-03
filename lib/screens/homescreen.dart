import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        .then((_) => Navigator.of(context).pushNamed('/loginscreen'));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var userDocument = snapshot.data;
            return Text("Welcome " + userDocument["name"]);
          }),
    );
  }
}
