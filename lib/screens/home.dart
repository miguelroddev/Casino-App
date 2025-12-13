import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
          child: Container(
             child: Column(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
                  child: Text("Lx Casino", 
                  style:TextStyle(color: const Color(0xFFFFBB00),
                  fontSize: 40, fontFamily:"MontSerrat",
                  fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: TextButton(onPressed:() {}, child: Text("Login",
                        style: TextStyle(color: const Color(0xFFFFBB00),
                        fontSize: 22),)
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: TextButton(onPressed:() {}, child: Text("Sign Up",
                        style: TextStyle(color: const Color(0xFFFFBB00),
                        fontSize: 22),)),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: TextButton(onPressed:() {}, child: Text("Admin Tools",
                        style: TextStyle(color: const Color(0xFFFFBB00),
                        fontSize: 22),)),
                      ),
                      ],
                  )
                ),
                ],
            ),
          )
        ),
      )
    );
  }
}