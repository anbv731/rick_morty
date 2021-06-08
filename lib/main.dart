import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty/screens/location/screen.dart';
import 'package:rick_morty/screens/locations/screen.dart';
import 'package:rick_morty/screens/splash_screen/screen.dart';

import 'data/person_model.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: StartScreen1()));

  // Person()..loadPerson();
}
