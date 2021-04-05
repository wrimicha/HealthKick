import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
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
      appBar: new AppBar(
          automaticallyImplyLeading: false, backgroundColor: Colors.pink[600]),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                // ignore: missing_return
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                // ignore: missing_return
                validator: (input) {
                  if (input.length < 6) {
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(labelText: 'Password'),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: () {
                  signIn(context);
                },
                child: Text('Sign in'),
              ),
            ],
          )),
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

              if (value.data()['type'] == "doctor") {
                //Navigator.of(context)
                // .pushNamed('/chathomescreen_doctor', arguments: user);
                Navigator.of(context).pushNamed('/searchscreen');
              }
              if (value.data()['type'] != "doctor")
                Navigator.of(context)
                    .pushNamed('/chathomescreen_patient', arguments: user);
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
