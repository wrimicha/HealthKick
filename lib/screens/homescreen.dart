import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final user;

  HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  String username;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            AppBar(title: Text("Home Page"), backgroundColor: Colors.pink[600]),
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
            }));
  }
}
