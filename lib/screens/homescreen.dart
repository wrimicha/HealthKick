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

  Future<void> demo() async {
    DocumentSnapshot documentSnapshot;
    String id = user.uid;
    String currUser = FirebaseAuth.instance.currentUser.uid;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(currUser)
        .get()
        .then((value) {
      documentSnapshot = value;
    });
    username = documentSnapshot['sex'];
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink[600],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [Text("Welcome $username")],
        ));
  }
}
