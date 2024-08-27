import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/first/login.dart';
import 'package:login/view/first/signup.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/image.png"))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150,left: 40),
            child: Text("welcome to fashion boutique",style: GoogleFonts.pacifico(color:Colors.black,fontSize:35),),
          ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                                      height: 40,
                                      width: 240,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromARGB(255, 252, 158, 189))),
                                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));},
                                          child:  Text("Login",style:GoogleFonts.inknutAntiqua(color:Colors.white),))),
                                          SizedBox(height: 30,),
                                    SizedBox(
                                      height: 40,
                                      width: 240,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromARGB(255, 252, 158, 189))),
                                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
                                          child:  Text("Sign Up",style:GoogleFonts.inknutAntiqua(color:Colors.white),))),      

                        ],


                      ),
                    )
         
        ],
      ),
    );
  }
}
