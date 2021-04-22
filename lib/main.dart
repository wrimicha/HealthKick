import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthkick/controller/route.dart';
import 'dart:async';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> main() async {
  //initializing firebase app.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generatedRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static const _center = const LatLng(43.6532, -79.3832);

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
          position: LatLng(43.6532, -79.3832),
        ),
      );
      _markers.add(
        Marker(markerId: MarkerId('id-2'),
          position: LatLng(43.6205, -79.5132),
        ),
      );
      _markers.add(
        Marker(markerId: MarkerId('id-3'),
          position: LatLng(43.7615, -79.4111),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.red[400], //testt
        automaticallyImplyLeading: false,
      ),
      body: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/loginscreen');
        },
        label: const Text("Login"),
        tooltip: 'Increment',
        icon: const Icon(Icons.login),
      ),
    );
  }
}