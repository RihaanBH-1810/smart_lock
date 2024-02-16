import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page1.dart';

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
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Color.fromARGB(255, 247, 247, 247),), onPressed: () {Navigator.pop(context);},),
        title: Text("Smart Lock",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontFamily: GoogleFonts.playfairDisplay().fontFamily,),),
        backgroundColor: Color.fromARGB(255, 1, 1, 1),
      ),
      body:Stack(
         children: [
          Positioned(
            top: screenHeight*0.08,
            left: screenWidth*0.14,
            child: Container(
            height: screenHeight*0.7,
            width: screenWidth*0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tick.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            
          ),
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
                      
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => start()));
                    },
                
                ),
            )
          )
         ],
      ));
    
  }
}