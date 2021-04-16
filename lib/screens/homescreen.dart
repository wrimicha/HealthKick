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
          margin: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          width: double.infinity,
          child: Column(
          children: [
            SizedBox(
            width: double.infinity,
             child: Container(
               margin: EdgeInsetsDirectional.fromSTEB(18.0, 0, 0, 15),
              child: Text(
                "Hello " + Constants.userName + ",",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 26.0,
                    fontWeight: FontWeight.bold),
              ),
             ),
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

          Container(
            //margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 220.0,
            margin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 15.0),
              Column(
                children: [
                  SizedBox(
                    height: 170.0,
                    width: 160.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red[400]),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          'assets/chat.png',
                          fit: BoxFit.contain,
                          width: 100,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/chathomescreen_patient');
                        },
                      ),
                    ),
                  SizedBox(height: 5.0),
                  Text("Doctor Chat"),
                ],
              ),
              SizedBox(width: 15.0),
              Column(
                children: [
                  SizedBox(
                    height: 170.0,
                    width: 160.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[400]),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ),
                      child: Image.asset(
                        'assets/meds.png',
                        fit: BoxFit.contain,
                        width: 100,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/chathomescreen_patient');
                      },
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("Medications"),
                ],
              ),
              SizedBox(width: 15.0),
              Column(
                children: [
                  SizedBox(
                    height: 170.0,
                    width: 160.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green[400]),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ),
                      child: Image.asset(
                        'assets/meds.png',
                        fit: BoxFit.contain,
                        width: 100,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/chathomescreen_patient');
                      },
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("Medications"),
                ],
              ),
              SizedBox(width: 15.0),
              Column(
                children: [
                  SizedBox(
                    height: 170.0,
                    width: 160.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[400]),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ),
                      child: Image.asset(
                        'assets/meds.png',
                        fit: BoxFit.contain,
                        width: 100,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/chathomescreen_patient');
                      },
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text("Medications"),
                ],
              ),
              SizedBox(width: 15.0),
            ],
          ),
          ),
        ],
      )),
    );
  }
}
