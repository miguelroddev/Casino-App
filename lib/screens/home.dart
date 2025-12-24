import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  final CasinoManager casinoManager;
  const Home({super.key, required this.casinoManager});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login_background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child : SafeArea(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
              child: const Text("Lx Casino", 
              style:TextStyle(color: Color(0xFFFFBB00),
              fontSize: 40, fontFamily:"MontSerrat",
              fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: TextButton(onPressed:() {
                      Navigator.pushNamed(context, '/login');
                    }, child: const Text("Login",
                    style: TextStyle(color: Color(0xFFFFBB00),
                    fontSize: 22),)
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: TextButton(onPressed:() {
                      Navigator.pushNamed(context, '/sign_up');
                    }, child: const Text("Sign Up",
                    style: TextStyle(color: Color(0xFFFFBB00),
                    fontSize: 22),)),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                  width: 250,
                  height: 60,
                  child: TextButton(onPressed:() {}, child: const Text("Admin Tools",
                  style: TextStyle(color: Color(0xFFFFBB00),
                  fontSize: 22),)),
                  ),
                ],
              )
            ),
          ],)
        ),
      )
    );
  }
}