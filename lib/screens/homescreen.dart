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
          width: double.infinity,
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

          Container(
            height: 80.0,
            width: double.infinity,
            //color: Colors.transparent,
            margin: EdgeInsetsDirectional.fromSTEB(18.0, 20, 18.0, 0),
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(4,131,184, .1),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child:
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 10, 0, 0),
                child: StreamBuilder<DocumentSnapshot>(
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
                          ? Text(
                          "No Appointments so far",
                            style: TextStyle(fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upcoming Appointments:",
                                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0),
                                Text(documentFields['appointments']),
                              ],
                        );
                    } else {
                      return Text("Loading...");
                    }
                  },
                ),
            ),
          ),
          ),
        ],
      )),
    );
  }
}
