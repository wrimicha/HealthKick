import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

// void main() {
//   runApp(MyApp());
// }

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

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
    DocumentSnapshot documentSnapshot;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        var user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        final User ur = FirebaseAuth.instance.currentUser;
        print(ur.email);
        print(ur.uid);
        printUserData(ur.uid);
        // ignore: unused_local_variable
        var ref = Navigator.of(context)
            .pushReplacementNamed('/homepage', arguments: ur);
      } catch (e) {
        print(e.message);
      }
    }
  }

  void printUserData(var user) {
    dynamic x;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');
    collectionReference.snapshots().listen((event) {
      print("${event.docs[1].data().keys} : ${event.docs[1].data().values}");
      print(event.docs[1].data()['sex']);
    });
  }
}
