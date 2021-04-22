import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  String userUID;
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
        .where('name', isEqualTo: patientName.toLowerCase())
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  getPatientId(String email, String data, String operation) async {
    String userid;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        userid = element.data()['id'];
        printVal(userid);
        if (operation == "appointment") {
          createPatientAppointment(userid, data);
        } else if (operation == "medications") {
          createPatientMedications(userid, data);
        } else if (operation == "vaccinations") {
          createPatientVaccination(userid, data);
        } else if (operation == "status") {
          createPatientForm(userid, data);
        }
      });
    });
  }

  createPatientAppointment(String uid, String date) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'appointments': date});
  }

  createPatientMedications(String uid, String med) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'medications': med});
  }

  createPatientVaccination(String uid, String vac) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'vaccination': vac});
  }

  createPatientForm(String uid, String status) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'status': status});
  }

  printVal(String a) {
    print(a);
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

  getUserChats(String myName) async {
    return FirebaseFirestore.instance
        .collection('chatroom')
        .where('users', arrayContains: myName)
        .snapshots();
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }
}
