import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Loginpage test"),
            MaterialApp(
              home: AuthenticationWrapper(),
            )
          ],
        ),
      ),
    );
  }
}

// if user is authenticated it will navigate them to home page.
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
