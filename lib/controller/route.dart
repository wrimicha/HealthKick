import 'package:flutter/material.dart';
import 'package:healthkick/main.dart';
import 'package:healthkick/screens/appointments.dart';
import 'package:healthkick/screens/chathomescreen_doctor.dart';
import 'package:healthkick/screens/chathomescreen_patient.dart';
import 'package:healthkick/screens/chatroomscreen.dart';
import 'package:healthkick/screens/healthform.dart';
import 'package:healthkick/screens/homescreen.dart';
import 'package:healthkick/screens/homescreendoctor.dart';
import 'package:healthkick/screens/loginscreen.dart';
import 'package:healthkick/screens/profile.dart';
import 'package:healthkick/screens/searchscreen.dart';

/*
 this class will be resonsible for handling the screen navigation of the application. It will also check if the passed values to this page is correct by 
 checking if the type passed is the one desired. If values are not correct, it will display an error page <Widget>. 
 */
class RouteGenerator {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final args = settings
        .arguments; //This variable will hold the data passed to the page.

    //checks the name of the page and navigates according to it.
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case '/loginscreen':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/homescreen':
        return MaterialPageRoute(builder: (_) => new HomePagePatient());

      case '/chathomescreen_patient':
        return MaterialPageRoute(builder: (_) => new ChatPatient());

      case '/chathomescreen_doctor':
        return MaterialPageRoute(builder: (_) => new ChatDoctor());

      case '/chatroomscreen':
        return MaterialPageRoute(builder: (_) => new Chat());

      case '/searchscreen':
        return MaterialPageRoute(builder: (_) => new Search());

      case '/homescreendoctor':
        return MaterialPageRoute(builder: (_) => new HomePageDoctor());

      case '/profilescreen':
        return MaterialPageRoute(builder: (_) => new ProfilePage());

      case '/appointmentscreen':
        return MaterialPageRoute(builder: (_) => new AppointmentPage());

      case '/healthformscreen':
        return MaterialPageRoute(builder: (_) => new HealthFrom());

      default: //if there is no route with the name specified, return an error page
        return _routeNotFound();
    }
  }

  static Route<dynamic> _routeNotFound() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR, PAGE NOT FOUND"),
        ),
      );
    });
  }
}
