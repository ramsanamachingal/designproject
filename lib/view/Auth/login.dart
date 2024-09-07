import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Service/firebase.dart';

import 'package:login/view/function.dart/style.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  FirebaseService obj1 = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/0e7b6fa2a031eda2175e210ff787dd5c.jpg"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 240),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.black)),
                        fillColor: Colors.white,
                        hintText: "Email",
                        hintStyle:
                            GoogleFonts.inknutAntiqua(color: Colors.black)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the email";
                        
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.white)),
                        hintText: "Password",
                        hintStyle:
                            GoogleFonts.inknutAntiqua(color: Colors.black)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter the password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: TextButton(
                        onPressed: () {
                          obj1.forgetPassword(_emailcontroller.text);
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPassword()));
                        },
                        child: Text(
                          "Foget Password?",
                          style: GoogleFonts.pacifico(
                              color: Colors.black, fontSize: 25),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: 170,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side:
                                        const BorderSide(color: Colors.white))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 252, 158, 189))),
                        onPressed: () {
                          logIn();
                         
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.inknutAntiqua(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future logIn() async {
    String a = _emailcontroller.text;
    String b = _passwordcontroller.text;
    print(a);
    print(b);

    User? user = await obj1.signinWithEmailAndPassword(a, b);
    if (user != null) {
      print("login successfully");
       Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  packages(indexnum: 0)));
    } else {
      print("incorrect email and password");
    }
  }
}
