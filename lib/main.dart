import 'package:casino_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/home",
    routes: {
      "/home": (context) => Home(),
    }
  )
);

