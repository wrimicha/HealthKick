import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthFrom extends StatefulWidget {
  @override
  HealthFormView createState() => HealthFormView();
}

class HealthFormView extends State<HealthFrom> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _medicationsController = TextEditingController();
  TextEditingController _healthStatusController = TextEditingController();
  TextEditingController _vaccinationController = TextEditingController();
  DateTime todaysDate = DateTime.now();
  var patientEmail;
  var medications;
  var vaccinations;
  var healthStatusDate =
      " As of ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}";
  var healthStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient's Health Form"),
        backgroundColor: Colors.pink[600],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text("Patient Email"),
                TextFormField(
                  controller: _emailController,
                  onSaved: (newValue) => patientEmail = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Email',
                    icon: Icon(Icons.email),
                  ),
                  validator: (value) => value.isEmpty
                      ? "Patient's email cannot be empty.\nPlease enter correct email"
                      : null,
                ),
                SizedBox(
                  height: 12,
                ),
                Text("Medications"),
                TextFormField(
                  controller: _medicationsController,
                  onSaved: (newValue) => medications = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Drugs',
                    icon: Icon(Icons.medical_services),
                  ),
                  validator: (value) => value.isEmpty
                      ? "Medications cannot be empty.\nPlease enter correct email"
                      : null,
                ),
                SizedBox(
                  height: 12,
                ),
                FlatButton(
                  child: Text("Add Medications"),
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(healthStatus); //add database method.
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text("Vaccinations"),
                TextFormField(
                  controller: _vaccinationController,
                  onSaved: (newValue) => vaccinations = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Vaccincations',
                    icon: Icon(Icons.coronavirus),
                  ),
                  validator: (value) => value.isEmpty
                      ? "Vaccinations cannot be empty.\nPlease enter correct email"
                      : null,
                ),
                SizedBox(
                  height: 12,
                ),
                FlatButton(
                  child: Text("Add Vaccinations"),
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(healthStatus); //add database method.
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text("Health Status"),
                TextFormField(
                  controller: _healthStatusController,
                  onSaved: (newValue) =>
                      healthStatus = newValue + healthStatusDate,
                  decoration: InputDecoration(
                    labelText: 'Patient Status As of Today',
                    icon: Icon(Icons.healing_outlined),
                  ),
                  validator: (value) => value.isEmpty
                      ? "Health Status cannot be empty.\nPlease enter correct email"
                      : null,
                ),
                SizedBox(
                  height: 12,
                ),
                FlatButton(
                  child: Text("Add Health Status"),
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(healthStatus); //add database method.
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
