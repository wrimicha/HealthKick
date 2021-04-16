import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthkick/models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthkick/services/database.dart';

//doctors appointment form.... will use database to set data for user using users email and password (maybe use the search class).
class AppointmentPage extends StatefulWidget {
  AppointmentScreen createState() => AppointmentScreen();
}

convertNumToDay(String day) {
  switch (day) {
    case '1':
      return 'Mon';
    case '2':
      return 'Tues';
    case '3':
      return 'Wed';
    case '4':
      return 'Thurs';
    case '5':
      return 'Fri';
    case '6':
      return 'Sat';
    case '7':
      return 'Sun';
  }
}

numToOrdinal(int num) {
  switch (num) {
    case 1:
    case 31:
    case 21:
      return '${num}st';
    case 2:
    case 22:
      return '${num}nd';
    case 3:
    case 23:
      return '${num}rd';
    default:
      return '${num}th';
  }
}

convertNumToMonth(String month) {
  switch (month) {
    case '1':
      return 'January';
    case '2':
      return 'Feburary';
    case '3':
      return 'March';
    case '4':
      return 'April';
    case '5':
      return 'May';
    case '6':
      return 'June';
    case '7':
      return 'July';
    case '8':
      return 'August';
    case '9':
      return 'September';
    case '10':
      return 'October';
    case '11':
      return 'November';
    case '12':
      return 'December';
  }
}

class AppointmentScreen extends State<AppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var patientEmail;
  var appointmentDate;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2022, 1));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var date =
            "${convertNumToDay(picked.weekday.toString())}. ${convertNumToMonth(picked.month.toString())} ${numToOrdinal(picked.day)}, With ${Constants.userName}";
        _dateController.text = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  onSaved: (newValue) => patientEmail = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Email',
                    icon: Icon(Icons.email),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      onSaved: (newValue) => appointmentDate = newValue,
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: "Appointment Date",
                        icon: Icon(Icons.calendar_today),
                      ),
                      validator: (value) {
                        if (value.isEmpty) return "Please add a patient date";
                        return null;
                      },
                    ),
                  ),
                ),
                FlatButton(
                  child: Text("Confirm Appointment Date"),
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      DatabaseManager()
                          .getPatientId(patientEmail, appointmentDate);
                    }
                    _dateController.clear();
                    _emailController.clear();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
