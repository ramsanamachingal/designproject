import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/first/otpScreen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
           SizedBox(
                                  height: 50,
                                  width: 290,
                                  child: TextFormField(style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide:const BorderSide(color: Colors.pink),
                                            borderRadius: BorderRadius.circular(7)),
                                            hintText: "Enter Phone Number",
                                            hintStyle: GoogleFonts.pacifico()
                                    )
                                  ),
                                ),
                                SizedBox(height: 40,),
                                ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Colors.white))),backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 231, 121, 158))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
              },
              child: Text(
                "Done",
                style: GoogleFonts.pacifico(color: Colors.white, fontSize: 25),
              ),
            )
        ],),
      ),
    );
  }
}