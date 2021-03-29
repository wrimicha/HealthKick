import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  Future getUserData() async {
    try {
      List items = [];
      await usersRef.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          items.add(element.data);
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
