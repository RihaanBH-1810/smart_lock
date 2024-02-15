import 'package:flutter/material.dart';


class success extends StatefulWidget {
  const success({Key? key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Center(
         child: Text("Connect to lock")),
      )
    ;
  }
}