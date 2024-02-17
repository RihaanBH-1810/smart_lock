import 'package:flutter/material.dart';
import 'Succes.dart';
import 'page.dart';
import 'username.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class start extends StatefulWidget {
  const start({Key? key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {

  String image = 'assets/images/lock.png';
  bool connect = false;
  final url = TextEditingController();
  String lockurl = '';

  // urlcheck(name) async{
  //   var client =http.Client();

  //   var uri = Uri.parse('http://group4attendance.pythonanywhere.com/api/courses/');
  //   client.post(
  //     uri,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, String> {'course_name': name})
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Lock",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontFamily: GoogleFonts.playfairDisplay().fontFamily,),),
        backgroundColor: Color.fromARGB(255, 1, 1, 1),
      ),
      body:Stack(
        children: [
        Positioned(
          top: screenHeight*0.10,
          left: screenWidth*0.3,
          child: Container(
            height: screenHeight*0.3,
            width: screenWidth*0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            
          )
        ),

        Positioned(
            top: screenHeight*0.40,
            left: screenWidth*0.2,
            child: Container(
              height: screenHeight*0.08,
              width: screenWidth*0.6,
            child: TextField(
              controller: url,
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 0, 0, 0), // Text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter lock url',
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
          top: screenHeight*0.51,
          left: screenWidth*0.34,
          child: ElevatedButton(
              child: Text("Save URL"),
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 253, 249, 249),
                      fontWeight: FontWeight.bold),),
              onPressed: () {
                    //urlcheck(url.text);
                    setState(() {
                      lockurl = url.text;
                    });

                  },
              
              ),
        ),

        Positioned(
          top: screenHeight*0.6,
          left: screenWidth*0.3,
          child: ElevatedButton(
              child: Text("Connect to lock"),
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 253, 249, 249),
                      fontWeight: FontWeight.bold),),
              onPressed: () {
                    //urlcheck(url.text);
                    setState(() {
                      image = 'assets/images/unlock.png';
                      connect = true;
                    });

                  },
              
              ),
        ),

        Positioned(
          top: screenHeight*0.7,
          left: screenWidth*0.3,
          child: ElevatedButton(
              child: Text("Enter Username"),
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 253, 249, 249),
                      fontWeight: FontWeight.bold),),
              onPressed: () {
                if (connect=true){
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => username(lockurl:lockurl,)));}
                else{print("sorry");}
                  },
              
              ),
        ),
      ])
    );
  }
}