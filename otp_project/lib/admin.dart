import 'package:flutter/material.dart';
import 'Succes.dart';
import 'page.dart';
import 'username.dart';
import 'package:google_fonts/google_fonts.dart';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Color.fromARGB(255, 247, 247, 247),), onPressed: () {Navigator.pop(context);},),
        title: Text("Smart Lock",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontFamily: GoogleFonts.playfairDisplay().fontFamily,),
        ),
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
            top: screenHeight*0.6,
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
            top: screenHeight*0.35,
            left: screenWidth*0.37,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 1, 1, 1)
              ),
             onPressed: () {  },
             child: Text("Add User",
             style: TextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily,),),),
             
          ),

          Positioned(
            top: screenHeight*0.74,
            left: screenWidth*0.345,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 1, 1, 1)
              ),
             onPressed: () {  },
             child: Text("Delete User",style: TextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily,),)),
             
          ),
          
          Positioned(
            top: screenHeight*0.02,
            left: screenWidth*0.12,
            child: Text("Welcome Admin,",
            style: TextStyle(
              fontSize: 30,
              fontFamily: GoogleFonts.playfairDisplay().fontFamily,
             ),),
          )
        ],
      ),
    );
  }
}