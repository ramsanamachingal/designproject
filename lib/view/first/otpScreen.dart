import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(children: [
      //   Container(
      //     height: MediaQuery.of(context).size.height,
      //     width: MediaQuery.of(context).size.width,
      //     decoration: BoxDecoration(),
      //   )
      // ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Enter the Otp",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 25),
          )),
          SizedBox(
            height: 40,
          ),
          Pinput(
            length: 6,
            onChanged: (value) {
              setState(() {
                code = value;
              });
            },
          ),
          SizedBox(height: 80,),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                    side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 231, 121, 158))),
            onPressed: () {},
            child: Text(
              "Verify",
              style: GoogleFonts.pacifico(color: Colors.white, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
