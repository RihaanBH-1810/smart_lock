import 'package:flutter/material.dart';
import 'Succes.dart';
import 'page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';



class username extends StatefulWidget {
  

  final String lockurl;

  username({required this.lockurl});

  @override
  State<username> createState() => _usernameState();
}

class _usernameState extends State<username> {

  final otp =  TextEditingController();

  namecheck(name) async{
    var client =http.Client();

    var uri = Uri.parse('http://group4attendance.pythonanywhere.com/api/courses/');
    client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String> {'course_name': name})
      );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Color.fromARGB(255, 247, 247, 247),), onPressed: () {Navigator.pop(context);},),
        title: Text("Smart Lock",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontFamily: GoogleFonts.playfairDisplay().fontFamily,),),
        backgroundColor: Color.fromARGB(255, 1, 1, 1),
      ),
      body: Stack(
        children: [
          // Positioned(
          //   top: screenHeight*0.15,
          //   left: screenWidth*0.1,
          //   child: Text("Enter Username"),
          // ),

          
          // Positioned(
          //   top: screenHeight*0.3,
          //   left: screenWidth*0.1,
          //   child: Container(
          //     height: 150,
          //     width: 300,
          //     // decoration: BoxDecoration(
          //     //   border: Border(: BorderRadius.all(Radius.circular(0)))
          //     // ),
          //   child: TextField(
          //     controller: otp,
          //     decoration: const InputDecoration(
          //                 hintText: 'Enter Username',
          //                 hintStyle: TextStyle(fontSize: 11,
          //                 color: Color.fromARGB(174, 1, 1, 1)),
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(0.1)),
          //                 ),)
          //     ),)
          // ),
          Positioned(
            top: screenHeight*0.07,
            left: screenWidth*0.1,
            child: Text("Welcome Back !",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    ),
                    ),
          ),

          Positioned(
            top: screenHeight*0.12,
            left: screenWidth*0.1,
            child: Text("Good to see you again",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    ),
                    ),
          ),

          Positioned(
            top: screenHeight*0.28,
            left: screenWidth*0.1,
            child: Container(
              height: screenHeight*0.08,
              width: screenWidth*0.8,
            child: TextField(
              controller: otp,
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 0, 0, 0), // Text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter username',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              )
            ),)
          ),


          Positioned(
            top: screenHeight*0.75,
            left: screenWidth*0.12,
            child: SizedBox(
              height: screenHeight*0.06,
              width: screenWidth*0.75,
              child: ElevatedButton(
                child: Text("Continue"),
                style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(250, 0, 0, 0),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10)
                  ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 253, 249, 249),
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        // fontWeight: FontWeight.bold
                        ),),
                onPressed: () {
                      namecheck(otp.text);
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home(
                        user: otp.text,
                        lockurl : widget.lockurl,
                      )));
                    },
                
                ),
            )
          )
        ],
      )
    );
  }
}