import 'package:flutter/cupertino.dart';

class Chat extends StatefulWidget {
  final String chatRoomId;

  Chat({this.chatRoomId});

  @override
  ChatRoom createState() => ChatRoom();
}

class ChatRoom extends State<Chat> {
  @override
  Widget build(BuildContext context) {}
}
