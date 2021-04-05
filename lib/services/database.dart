import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  getPatientByOffice(String office, String patientName) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('office', isEqualTo: office)
        .where('type', isEqualTo: 'patient')
        .where('name', isEqualTo: patientName)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String id, roomData) {
    FirebaseFirestore.instance
        .collection('chatroom')
        .doc(id)
        .set(roomData)
        .catchError((e) {
      print(e.toString());
    });
  }
}
