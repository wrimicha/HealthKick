import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:healthkick/models/constants.dart';
import 'package:healthkick/models/patient.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healthkick/services/database.dart';
import 'package:healthkick/services/helper.dart';

// void main() {
//   runApp(MyApp());
// }

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  AuthenticationServices auth = new AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),

                  Container(
                      margin: EdgeInsetsDirectional.fromSTEB(18.0, 0, 18.0, 0),
                      //padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[500],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Please sign in with your email registered at Northgate Medical Doctors Office',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black38,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          TextFormField(
                            // ignore: missing_return
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Provide an email';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                            onSaved: (input) => _email = input,
                          ),
                          SizedBox(height: 40.0),
                          TextFormField(
                            // ignore: missing_return
                            validator: (input) {
                              if (input.length < 6) {
                                return 'Longer password please';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                            onSaved: (input) => _password = input,
                            obscureText: true,
                          ),
                          SizedBox(height: 70.0),
                          SizedBox(
                            height: 60.0,
                            width: double.infinity, // <-- match_parent
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red[400]),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      side: BorderSide(color: Colors.red)
                                  ),
                                ),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                signIn(context);
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              )),
          )
    );
  }

  void signIn(BuildContext context) async {
    String typeOfUser;

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await auth
            .signInWithEmailAndPass(_email, _password)
            .then((result) async {
          if (result != null) {
            User user = FirebaseAuth.instance.currentUser;
            var userQuery = FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get()
                .then((value) {
              print(value.data());
              typeOfUser = value.data()['type'];
              Constants.userName = value.data()['name'];

              if (value.data()['type'] == "doctor") {
                print(Constants.userName);
                //Navigator.of(context)
                // .pushNamed('/chathomescreen_doctor', arguments: user);
                Navigator.of(context).pushNamed('/homescreendoctor');
              }
              if (value.data()['type'] != "doctor")
                Navigator.of(context).pushNamed('/homescreen');
            });

            //for testing, ill navigate users to chat screen (instead of homescreen)

            //Navigator.of(context).pushNamed('/homescreen', arguments: user);
          }
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
