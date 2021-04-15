import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/models/constants.dart';
import 'package:healthkick/services/authenticationservice.dart';
import 'package:healthkick/services/database.dart';

import 'chatroomscreen.dart';

class ChatPatient extends StatefulWidget {
  @override
  ChatHomePatient createState() => ChatHomePatient();
}

class ChatHomePatient extends State<ChatPatient> {
  DatabaseManager manager = new DatabaseManager();
  Stream chatRooms;
  var username;
  //todo: factoring this method -- added it in databaseManager class to avoid repetetion.
  Future<String> getUserNameFromDb() {
    User user = FirebaseAuth.instance.currentUser;
    var userQuery = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      username = value.data()['name'];
      print(username);
    });
    return username;
  }

  void _signOut(BuildContext context) {
    AuthenticationServices()
        .signOut()
        .then((_) => Navigator.of(context).pushNamed('/'));
  }

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: Constants.chattingWith = snapshot.data.docs[index]
                        .data()['chatRoomId']
                        .toString()
                        .split('_')
                        .first,
                    chatRoomId: snapshot.data.docs[index].data()['chatRoomId'],
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfoChats();

    getUserNameFromDb();
    super.initState();
  }

  getUserInfoChats() async {
    await DatabaseManager().getUserChats(Constants.userName).then((snapshot) {
      setState(() {
        chatRooms = snapshot;
        print(
            "we got the data + ${chatRooms.toString()} name is ${Constants.userName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [
          Center(
              child: Text(
            "Logout",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          )),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _signOut(context);
              })
        ],
        backgroundColor: Colors.pink[600],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: chatRoomsList(),
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName, @required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chat(
                      chatRoomId: chatRoomId,
                    )));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
