import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/cupertino.dart';

//doctors appointment form.... will use database to set data for user using users email and password (maybe use the search class).
class AppointmentPage extends StatefulWidget {
  AppointmentScreen createState() => AppointmentScreen();
}

class AppointmentScreen extends State<AppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
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
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
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
                          labelText: "Appoitnment Date",
                          icon: Icon(Icons.calendar_today)),
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
                      print(patientEmail);
                    }
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
