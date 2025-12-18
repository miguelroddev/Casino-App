import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/models/casino_model.dart' as model;

import 'package:casino_app/screens/home.dart';
import 'package:casino_app/screens/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  Hive
    ..registerAdapter(model.DateAdapter())
    ..registerAdapter(model.PlayerTypeAdapter())
    ..registerAdapter(model.PlayerAdapter())
    ..registerAdapter(model.CasinoAdapter());
    
  CasinoManager? casinoManager = await CasinoManager.loadCasino();
  casinoManager ??= CasinoManager(Casino());
  
  runApp(MyApp(casinoManager: casinoManager));
}

class MyApp extends StatelessWidget {
  final CasinoManager casinoManager;
  const MyApp({super.key, required this.casinoManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFBB00),
          brightness: Brightness.dark,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xFFFFBB00)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFBB00)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFBB00), width: 2),
          ),
          errorStyle: TextStyle(
            color: Color(0xFFFFBB00),
            fontSize: 12,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFBB00)),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFBB00), width: 2),
          ),
        ),
      ),

      initialRoute: "/home",
      routes: {
        "/home": (context) => Home(casinoManager: casinoManager),
        "/sign_up": (context) => SignUp(casinoManager: casinoManager),
      },
    );
  }
}
