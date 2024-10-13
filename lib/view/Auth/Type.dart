import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Auth/DesigLogin.dart';
import 'package:login/view/Auth/ShopLogin.dart';
import 'package:login/view/Auth/page1.dart';

class TypePage extends StatefulWidget {
  const TypePage({super.key});

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
              child: Text(
            "Are you a.......?",
            style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 30),
          )),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.pink))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.pink)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstPage()));
                },
                child: Text(
                  "User",
                  style:
                      GoogleFonts.pacifico(color: Colors.white, fontSize: 30),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.pink))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.pink)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignerLogin()));
                },
                child: Text(
                  "Designer",
                  style:
                      GoogleFonts.pacifico(color: Colors.white, fontSize: 30),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(color: Colors.pink))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.pink)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShopLogin()));
                },
                child: Text(
                  "Shop",
                  style:
                      GoogleFonts.pacifico(color: Colors.white, fontSize: 30),
                )),
          )
        ],
      ),
    );
  }
}
