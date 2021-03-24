import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;

  HomePage({
    Key key,
    @required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink[600],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [Text("Welcome $email")],
        ));
  }
}
