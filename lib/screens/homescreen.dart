import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final user;

  HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink[600],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [Text("Welcome $user")],
        ));
  }
}
