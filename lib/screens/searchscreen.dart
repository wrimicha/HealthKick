import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthkick/screens/chatroomscreen.dart';
import 'package:healthkick/services/database.dart';
import 'package:flutter/material.dart';
import 'package:healthkick/widget/widget.dart';

class Search extends StatefulWidget {
  @override
  SearchScreen createState() => SearchScreen();
}

var username;
//todo: factoring this method -- added it in databaseManager class to avoid repetetion.
String docInfo() {
  var docOffice;
  User user = FirebaseAuth.instance.currentUser;
  var userQuery = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .get()
      .then((value) {
    docOffice = value.data()['office'];
    username = value.data()['name'];
  });
  docOffice.toString();
}

class SearchScreen extends State<Search> {
  DatabaseManager manager = new DatabaseManager();
  TextEditingController searchController = new TextEditingController();
  QuerySnapshot usersListSnapshot;

  bool isLoading = false;
  bool isSearching = false;

  initSearch() async {
    if (searchController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await manager
          .getPatientByOffice(docInfo(), searchController.text)
          .then((snapshot) {
        usersListSnapshot = snapshot;
        print(usersListSnapshot.size);

        setState(() {
          isLoading = false;
          isSearching = true;
        });
      });
    }
  }

  Widget patientList() {
    return isSearching
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: usersListSnapshot.docs.length,
            itemBuilder: (context, index) {
              return userTile(
                usersListSnapshot.docs[index].data()['name'],
                usersListSnapshot.docs[index].data()['email'],
              );
            },
          )
        : Container();
  }

  sendMessage(String receiverName) {
    List<String> users = [username, receiverName];
    String chatRoomId = getChatRoomId(username, receiverName);

    Map<String, dynamic> chatRoom = {
      'users': users,
      "chatRoomId": chatRoomId,
    };

    manager.createChatRoom(chatRoomId, chatRoom);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatRoom(chatRoomId: chatRoomId)));
  }

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                userEmail,
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(24)),
              child: Text(
                "Message",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    color: Color(0x54FFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            style: simpleTextStyle(),
                            decoration: InputDecoration(
                                hintText: "search username ...",
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                border: InputBorder.none),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              initSearch();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        const Color(0x36FFFFFF),
                                        const Color(0x0FFFFFFF)
                                      ],
                                      begin: FractionalOffset.topLeft,
                                      end: FractionalOffset.bottomRight),
                                  borderRadius: BorderRadius.circular(40)),
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.search,
                                size: 24,
                              ),
                            )),
                      ],
                    ),
                  ),
                  patientList()
                ],
              ),
            ),
    );
  }
}
