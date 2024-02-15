import 'package:flutter/material.dart';
import 'Succes.dart';
import 'page.dart';
import 'username.dart';

class start extends StatefulWidget {
  const start({Key? key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {

  String image = 'assets/images/lock.png';

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
      body:Stack(
        children: [
        Positioned(
          top: screenHeight*0.3,
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
          top: screenHeight*0.7,
          left: screenWidth*0.3,
          child: ElevatedButton(
              child: Text("Connect to lock"),
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 253, 249, 249),
                      fontWeight: FontWeight.bold),),
              onPressed: () { 
                    setState(() {
                      image = 'assets/images/unlock.png';
                    });
                  },
              
              ),
        ),

        Positioned(
          top: screenHeight*0.8,
          left: screenWidth*0.3,
          child: ElevatedButton(
              child: Text("Enter Username"),
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 253, 249, 249),
                      fontWeight: FontWeight.bold),),
              onPressed: () { 
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => username()));
                  },
              
              ),
        ),
      ])
    );
  }
}