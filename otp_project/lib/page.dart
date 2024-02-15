import 'package:flutter/material.dart';
import 'package:otp_project/admin.dart';
import 'Succes.dart';
import 'admin.dart';




class Home extends StatefulWidget {
  //const Home({Key? key});

  final String user;

  Home({required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final otp =  TextEditingController();

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
            top: screenHeight*0.15,
            left: screenWidth*0.1,
            child: Text("Enter OTP"),
          ),
          Positioned(
            top: screenHeight*0.3,
            left: screenWidth*0.1,
            child: Container(
              height: 150,
              width: 300,
              // decoration: BoxDecoration(
              //   border: Border(: BorderRadius.all(Radius.circular(0)))
              // ),
            child: TextField(
              controller: otp,
              decoration: const InputDecoration(
                          hintText: 'Enter otp',
                          hintStyle: TextStyle(fontSize: 11,
                          color: Color.fromARGB(174, 1, 1, 1)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.1)),
                          ),)
              ),)
          ),
          Positioned(
            top: screenHeight*0.7,
            left: screenWidth*0.2,
            child: ElevatedButton(
              child: Text("verify"),
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 253, 249, 249),
                      fontWeight: FontWeight.bold),),
              onPressed: () {

                if(widget.user=='admin'){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => admin()
                      
                    ));}

                else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => success()
                      
                    ));
                }

                
                  },
              
              )
          )
        ],
      )
    );
  }
}