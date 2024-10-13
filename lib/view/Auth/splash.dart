import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Auth/Type.dart';
import 'package:login/view/Auth/page1.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
      gotoMain();
    super.initState();
 
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Stylish",style: GoogleFonts.pacifico(color: Colors.pink,fontSize: 50),),),
    );
  }
Future<void> gotoMain()async {
await Future.delayed(Duration(seconds: 3));
Navigator.push(context, MaterialPageRoute(builder: (context)=> TypePage()));
}


}

