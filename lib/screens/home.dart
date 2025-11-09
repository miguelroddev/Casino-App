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
      body: 
      Row(children: [
        TextButton(onPressed:() {}, child: Text("ag")),
        TextButton(onPressed: (){},child: Text("2222"))
      ],),
    );
  }
}