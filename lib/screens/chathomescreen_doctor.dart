import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:healthkick/services/database.dart';

class ChatDoctor extends StatefulWidget {
  @override
  ChatHomeDoctor createState() => ChatHomeDoctor();
}

class ChatHomeDoctor extends State<ChatDoctor> {
  DatabaseManager manager = new DatabaseManager();
  QuerySnapshot usersListSnapshot;

  void _signOut(BuildContext context) {
    AuthenticationServices()
        .signOut()
        .then((_) => Navigator.of(context).pushNamed('/loginscreen'));
  }

  @override
  Widget build(BuildContext context) {}
}
