import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink[600],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [Text("Home Page")],
        ));
  }
}
