import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthkick/models/patient.dart';
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
        // ignore: unused_local_variable
        var user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        final User ur = FirebaseAuth.instance.currentUser;
        final CollectionReference postRef =
            FirebaseFirestore.instance.collection('/users');

        Map<String, dynamic> postData = {
          "Name": ur.displayName,
          "Age": "20",
          "ID": ur.uid,
          "Email": ur.email
        };
        await postRef.doc(ur.uid).set(postData);

        // ignore: unused_local_variable
        var ref = Navigator.of(context)
            .pushReplacementNamed('/homepage', arguments: ur.uid);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
