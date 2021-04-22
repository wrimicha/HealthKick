//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthkick/controller/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthkick/models/constants.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

// class ProfilePage extends StatefulWidget{
//   @override
//   _ProfilePage createState() => _ProfilePage();
// }

// enum AppState {
//   free,
//   picked,
//   cropped,
// }
//
// var errorTitle = ["Camera Error", "Cropping Error"];
// var errorMsg = ["Image was not selected", "Crop was cancelled"];
//
// class _ProfilePage extends State<ProfilePage> {
//
//   File _image;
//   AppState _state;
//
//   /// Reference for Alert Dialog Box: https://api.flutter.dev/flutter/material/AlertDialog-class.html
//   Future<void> _showError(String title, String msg) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(msg),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   /// Reference for Image Picker: https://pub.dev/packages/image_picker
//   /// Reference for Image Cropper: https://pub.dev/packages/image_cropper
//   Future _openCamera() async {
//     final image = await ImagePicker().getImage(source: ImageSource.camera);
//     if (image == null){
//       _showError(errorTitle[0], errorMsg[0]);
//     }
//     this.setState(() {
//       _state = AppState.picked;
//     });
//     _image = File(image.path);
//     File croppedFile = await ImageCropper.cropImage(
//         sourcePath: _image.path,
//         maxHeight: MediaQuery.of(context).size.height~/2, //Reference for media query: https://api.flutter.dev/flutter/widgets/MediaQuery-class.html
//         maxWidth: MediaQuery.of(context).size.width~/2,
//         androidUiSettings: AndroidUiSettings(
//             toolbarTitle: 'Edit Photo',
//             backgroundColor: Colors.white,
//             hideBottomControls: true,
//             lockAspectRatio: false));
//     if (croppedFile != null) {
//       _image = croppedFile;
//       setState(() {
//         _state = AppState.cropped;
//       });
//     } else {
//       _showError(errorTitle[1], errorMsg[1]);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(    //Reference for scaffold: https://api.flutter.dev/flutter/material/Scaffold-class.html
//       appBar: AppBar(
//         title: Text('PICTURE APPLICATION'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         elevation: 0.0,
//         leading: new IconButton(     //Reference for leading: https://api.flutter.dev/flutter/material/AppBar/leading.html
//           icon: new Icon(Icons.home),
//           onPressed: () {},
//         ),
//         actions: [
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0), //Reference for padding: https://api.flutter.dev/flutter/painting/EdgeInsets-class.html
//         child: Stack(
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,       //Reference for mainAxis vs. crossAxis: https://stackoverflow.com/questions/53850149/flutter-crossaxisalignment-vs-mainaxisalignment
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'By: Michael Wright, 991585525',
//                 ),
//                 SizedBox(height: 20.0),
//                 Center(
//                   child: _state == AppState.cropped ? Image.file(_image) : Image.asset('assets/profile_empty.jpg'),
//                 ),
//                 SizedBox(height: 20.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     RaisedButton( //Reference for RaisedButton: https://api.flutter.dev/flutter/material/RaisedButton-class.html
//                         onPressed: _openCamera,
//                         textColor: Colors.white,
//                         color: Colors.green[700],
//                         child: const Text('TAKE PICTURE')
//                     ),
//                     SizedBox(width: 10.0),
//                     RaisedButton(
//                         onPressed: () {
//                           setState(() {
//                             _image = null;
//                             _state = AppState.free;
//                           });
//                         },
//                         textColor: Colors.white,
//                         color: Colors.blue[500],
//                         child: const Text('RESET PICTURE')
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String age;
  String gender;
  String weight;
  String dateOfBirth;

  @override
  void initState() {
    super.initState();
    data();
  }

  Future<void> data() async {
    User user = FirebaseAuth.instance.currentUser;
    var userQuery = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      // age = value.data()['age'];
      // gender = value.data()['gender'];
      // weight = value.data()['weight'];
      // dateOfBirth = value.data()['birth'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Text('My App'),
            backgroundColor: Colors.red[400],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
            //Reference for padding: https://api.flutter.dev/flutter/painting/EdgeInsets-class.html
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //Reference for mainAxis vs. crossAxis: https://stackoverflow.com/questions/53850149/flutter-crossaxisalignment-vs-mainaxisalignment
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Center(
                        child: Column(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          'assets/profile_empty.jpg',
                          width: 150,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Personal Information',
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        Constants.userName, //change this to name from firebase
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Age: ${Constants.age}', //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Gender: ${Constants.gender}', //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Weight: ${Constants.weight}', //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Date of Birth: ${Constants.dateOfBirth}',
                        //change this to name from firebase
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Vaccinations',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Medications',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Health History',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[100]),
                          ),
                          child: Text(
                            'Visit History',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ),
                    ])),
                    SizedBox(height: 20.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
