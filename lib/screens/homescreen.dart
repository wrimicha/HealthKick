import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/models/constants.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:healthkick/services/database.dart';

class HomePagePatient extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<HomePagePatient> {
  void _signOut(BuildContext context) {
    AuthenticationServices()
        .signOut()
        .then((_) => Navigator.of(context).pushNamed('/'));
  }

  var oneSec = const Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Center(),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).pushNamed('/profilescreen');
              })
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
              //getAppointments();
              //print(appointments);
            },
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(Constants.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading...");
              } else if (snapshot.hasData) {
                Map<String, dynamic> documentFields = snapshot.data.data();
                return documentFields['appointments'].toString().isEmpty
                    ? Text("No Appointments so far")
                    : Text("Upcoming Appointments:\n" +
                        documentFields['appointments']);
              } else {
                return Text("Loading");
              }
            },
          )
        ],
      )),
    );
  }
}
