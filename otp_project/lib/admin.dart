import 'package:flutter/material.dart';
import 'Succes.dart';
import 'page.dart';
import 'username.dart';

class admin extends StatefulWidget {
  const admin({Key? key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {

  String image = 'assets/images/lock.png';
  final username = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Lock",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        backgroundColor: Color.fromARGB(255, 1, 1, 1),
      ),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight*0.1,
            left: screenWidth*0.1,
            child: Container(
              height: screenHeight*0.35,
              width: screenWidth*0.78,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 1, 1),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Positioned(
            top: screenHeight*0.5,
            left: screenWidth*0.1,
            child: Container(
              height: screenHeight*0.35,
              width: screenWidth*0.78,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 1, 1),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),

          
          
          
          
          
          
          
          
          Positioned(
            top: screenHeight*0.15,
            left: screenWidth*0.2,
            child: Container(
              height: screenHeight*0.06,
              width: screenWidth*0.6,
            child: TextField(
              controller: username,
              style: TextStyle(
                fontSize: 16.0,
                color: const Color.fromARGB(255, 255, 255, 255), // Text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter username',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              )
            ),)
          ),

          Positioned(
            top: screenHeight*0.25,
            left: screenWidth*0.2,
            child: Container(
              height: screenHeight*0.06,
              width: screenWidth*0.6,
            child: TextField(
              controller: username,
              style: TextStyle(
                fontSize: 16.0,
                color: const Color.fromARGB(255, 255, 255, 255), // Text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter emailid',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              )
            ),)
          ),

          Positioned(
            top: screenHeight*0.54,
            left: screenWidth*0.2,
            child: Container(
              height: screenHeight*0.06,
              width: screenWidth*0.6,
            child: TextField(
              controller: username,
              style: TextStyle(
                fontSize: 16.0,
                color: const Color.fromARGB(255, 255, 255, 255), // Text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter username',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              )
            ),)
          ),


          

        ],
      ),
    );
  }
}