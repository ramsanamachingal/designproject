import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Service/firebase.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController=TextEditingController();
  FirebaseService ob = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/0e7b6fa2a031eda2175e210ff787dd5c.jpg"))),
        child: Padding(
          padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.pink)),
                    hintText: "enter the email",
                    hintStyle: GoogleFonts.pacifico(
                        color: Colors.black.withOpacity(0.5), fontSize: 25)),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Colors.white))),
                      backgroundColor: MaterialStatePropertyAll(
                          const Color.fromARGB(255, 245, 150, 181))),
                  onPressed: () {
                    ob.forgetPassword(_emailController.text);
                  },
                  child: Text(
                    "send",
                    style: GoogleFonts.pacifico(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
