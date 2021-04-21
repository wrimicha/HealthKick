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
                Text("Patient Email"),
                TextFormField(
                  controller: _emailController,
                  onSaved: (newValue) => patientEmail = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Email',
                    icon: Icon(Icons.email),
                  ),
                ),
                Text("Medications"),
                TextFormField(
                  controller: _medicationsController,
                  onSaved: (newValue) => medications = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Drugs',
                    icon: Icon(Icons.medical_services),
                  ),
                ),
                Text("Vaccinations"),
                TextFormField(
                  controller: _vaccinationController,
                  onSaved: (newValue) => vaccinations = newValue,
                  decoration: InputDecoration(
                    labelText: 'Patient Vaccincations',
                    icon: Icon(Icons.coronavirus),
                  ),
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
                ),
                FlatButton(
                  child: Text("ADD"),
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(healthStatus);
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
