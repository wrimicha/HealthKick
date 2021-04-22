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
          margin: EdgeInsetsDirectional.fromSTEB(18.0, 60, 18.0, 0),
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsetsDirectional.fromSTEB(18.0, 0, 0, 15),
              child: Text(
                "Hello " + Constants.userName + ",",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60.0,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red[400]),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
              child: Text(
                "Go to chat page",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/chathomescreen_doctor');
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60.0,
            width: double.infinity, // <-- match_parent
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red[400]),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
              child: Text(
                "Create Patient Appointments",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/appointmentscreen');
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60.0,
            width: double.infinity, // <-- match_parent
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red[400]),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
              child: Text(
                "Patient Health Form",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/healthformscreen');
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // RaisedButton(
          //   child: Text("Go to chat page"),
          //   onPressed: () {
          //     Navigator.of(context).pushNamed('/chathomescreen_doctor');
          //   },
          // ),
          // RaisedButton(
          //   child: Text("Create Patient Appointments"),
          //   onPressed: () {
          //     Navigator.of(context).pushNamed('/appointmentscreen');
          //   },
          // ),
          // RaisedButton(
          //   child: Text("Patient's Health Form"),
          //   onPressed: () {
          //     Navigator.of(context).pushNamed('/healthformscreen');
          //   },
          // )
        ],
      )),
    );
  }
}
