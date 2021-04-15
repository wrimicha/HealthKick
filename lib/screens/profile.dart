import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthkick/controller/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('I\'m an App'),
          backgroundColor: Colors.red[600],
        ),
        body: Padding(
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
                          style: TextStyle(fontSize: 26.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'James Johnson', //change this to name from firebase
                          style: TextStyle(fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Age:', //change this to name from firebase
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          'Gender:', //change this to name from firebase
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          'Weight:', //change this to name from firebase
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          'Date of Birth:',
                          //change this to name from firebase
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity, // <-- match_parent
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.grey[100]),
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
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.grey[100]),
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
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.grey[100]),
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
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.grey[100]),
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
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('I\'m an App'),
//           backgroundColor: Colors.red[600],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
//           //Reference for padding: https://api.flutter.dev/flutter/painting/EdgeInsets-class.html
//           child: Stack(
//             children: <Widget>[
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 //Reference for mainAxis vs. crossAxis: https://stackoverflow.com/questions/53850149/flutter-crossaxisalignment-vs-mainaxisalignment
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: 20.0),
//                   Center(
//                       child: Column(children: <Widget>[
//                         Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 2,
//                             ),
//                           ),
//                           child: Image.asset(
//                             'assets/profile_empty.jpg',
//                             width: 150,
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         Text(
//                           'Personal Information',
//                           style: TextStyle(fontSize: 26.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 20.0),
//                         Text(
//                           'James Johnson', //change this to name from firebase
//                           style: TextStyle(fontSize: 20.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 20.0),
//                         Text(
//                           'Age:', //change this to name from firebase
//                           style: TextStyle(fontSize: 14.0),
//                         ),
//                         Text(
//                           'Gender:', //change this to name from firebase
//                           style: TextStyle(fontSize: 14.0),
//                         ),
//                         Text(
//                           'Weight:', //change this to name from firebase
//                           style: TextStyle(fontSize: 14.0),
//                         ),
//                         Text(
//                           'Date of Birth:',
//                           //change this to name from firebase
//                           style: TextStyle(fontSize: 14.0),
//                         ),
//                         SizedBox(height: 20.0),
//                         SizedBox(
//                           width: double.infinity, // <-- match_parent
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<
//                                   Color>(Colors.grey[100]),
//                             ),
//                             child: Text(
//                               'Vaccinations',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onPressed: () {
//                               print('Pressed');
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         SizedBox(
//                           width: double.infinity, // <-- match_parent
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<
//                                   Color>(Colors.grey[100]),
//                             ),
//                             child: Text(
//                               'Medications',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onPressed: () {
//                               print('Pressed');
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         SizedBox(
//                           width: double.infinity, // <-- match_parent
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<
//                                   Color>(Colors.grey[100]),
//                             ),
//                             child: Text(
//                               'Health History',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onPressed: () {
//                               print('Pressed');
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         SizedBox(
//                           width: double.infinity, // <-- match_parent
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<
//                                   Color>(Colors.grey[100]),
//                             ),
//                             child: Text(
//                               'Visit History',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onPressed: () {
//                               print('Pressed');
//                             },
//                           ),
//                         ),
//                       ])),
//                   SizedBox(height: 20.0),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

