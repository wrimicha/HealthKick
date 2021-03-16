import 'package:flutter/material.dart';
import 'package:healthkick/main.dart';

void main() => runApp(MyApp());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text("Loginpage test")],
        ),
      ),
    );
  }
}
