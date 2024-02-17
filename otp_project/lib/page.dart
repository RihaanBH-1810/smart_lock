import 'package:flutter/material.dart';
import 'package:otp_project/admin.dart';
import 'Succes.dart';
import 'admin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  //const Home({Key? key});

  final String user;

  Home({required this.user, required this.lockurl});

  final String lockurl;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final otp = TextEditingController();

  Future<void> otpcheck(String otp) async {
    final uri = Uri.parse('http://${widget.lockurl}/otp');

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{'otp': otp}),
      );

      if (response.statusCode == 200) {
        print('Request successful');
        print('Response body: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 247, 247, 247),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Smart Lock",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 1, 1, 1),
        ),
        body: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.1,
              child: Text(""), //enter otp
            ),

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
            //                 hintText: 'Enter otp',
            //                 hintStyle: TextStyle(fontSize: 11,
            //                 color: Color.fromARGB(174, 1, 1, 1)),
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.all(Radius.circular(0.1)),
            //                 ),)
            //     ),)
            // ),

            Positioned(
              top: screenHeight * 0.1,
              left: screenWidth * 0.116,
              child: Text(
                "We sent a code to your mail",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                ),
              ),
            ),

            Positioned(
              top: screenHeight * 0.12,
              left: screenWidth * 0.1,
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            Positioned(
                top: screenHeight * 0.28,
                left: screenWidth * 0.1,
                child: Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.8,
                  child: TextField(
                      controller: otp,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 0, 0, 0), // Text color
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter OTP',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      )),
                )),

            Positioned(
              top: screenHeight * 0.37,
              left: screenWidth * 0.12,
              child: Text(
                "Didn't recieve the otp?",
                style: TextStyle(
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                ),
              ),
            ),

            Positioned(
              top: screenHeight * 0.348,
              left: screenWidth * 0.64,
              child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    "resend OTP",
                    style: TextStyle(
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    ),
                  )),
            ),

            Positioned(
                top: screenHeight * 0.75,
                left: screenWidth * 0.12,
                child: SizedBox(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.75,
                  child: ElevatedButton(
                    child: Text(
                      "verify",
                      style: TextStyle(
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      ),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //       backgroundColor: Color.fromARGB(250, 0, 0, 0),
                    //       foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    //       textStyle: TextStyle(
                    //         fontSize: 15,
                    //         color: Color.fromARGB(255, 253, 249, 249),
                    //         fontWeight: FontWeight.bold),),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(250, 0, 0, 0),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 253, 249, 249),
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {
                      print(otp.text);
                      otpcheck(otp.text);
                      if (widget.user == 'admin') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => admin(
                                      lockurl: widget.lockurl,
                                    )));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => success()));
                      }
                    },
                  ),
                ))
          ],
        ));
  }
}
