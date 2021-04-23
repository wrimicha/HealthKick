//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthkick/controller/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthkick/models/constants.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    data();
  }

  Future<void> data() async {
    User user = FirebaseAuth.instance.currentUser;
    var userQuery = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      // age = value.data()['age'];
      // gender = value.data()['gender'];
      // weight = value.data()['weight'];
      // dateOfBirth = value.data()['birth'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Text('My App'),
            backgroundColor: Colors.red[400],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
            //Reference for padding: https://api.flutter.dev/flutter/painting/EdgeInsets-class.html
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //Reference for mainAxis vs. crossAxis: https://stackoverflow.com/questions/53850149/flutter-crossaxisalignment-vs-mainaxisalignment
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Center(
                        child: Column(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          'assets/profile_empty.jpg',
                          width: 150,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Personal Information',
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        Constants.userName, //change this to name from firebase
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Age: ${Constants.age}', //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Gender: ${Constants.gender}', //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Weight: ${Constants.weight}', //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Date of Birth: ${Constants.dateOfBirth}',
                        //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Office: ${Constants.office}',
                        //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Vaccinations',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VaccinationView()));
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Medications',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MedicationView()));
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Health History',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HistoyView()));
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Visit History',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VisitView()));
                          },
                        ),
                      ),
                    ])),
                    SizedBox(height: 20.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VaccinationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vaccinations"),
          backgroundColor: Colors.red[600],
        ),
        body: Container(
            child: Container(
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
                return documentFields['vaccination'].toString().isEmpty
                    ? Text(
                        "No Vaccincations so far",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vaccinations:",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            documentFields['vaccination'],
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      );
              } else {
                return Text("Loading...");
              }
            },
          ),
        )));
  }
}

class MedicationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Medications"),
          backgroundColor: Colors.red[600],
        ),
        body: Container(
            child: Container(
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
                return documentFields['medications'].toString().isEmpty
                    ? Text(
                        "No medications so far",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Medications:",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            documentFields['medications'],
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      );
              } else {
                return Text("Loading...");
              }
            },
          ),
        )));
  }
}

class HistoyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Health History"),
          backgroundColor: Colors.red[600],
        ),
        body: Container(
            child: Container(
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
                return documentFields['status'].toString().isEmpty
                    ? Text(
                        "History is empty",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "History:",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            documentFields['status'],
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      );
              } else {
                return Text("Loading...");
              }
            },
          ),
        )));
  }
}

class VisitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Visit History"),
          backgroundColor: Colors.red[600],
        ),
        body: Container(
            child: Container(
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
                        "History is empty",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Visit History:",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            documentFields['appointments'],
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      );
              } else {
                return Text("Loading...");
              }
            },
          ),
        )));
  }
}
