import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerInfo extends StatefulWidget {
  const DesignerInfo({super.key});

  @override
  State<DesignerInfo> createState() => _DesignerInfoState();
}

class _DesignerInfoState extends State<DesignerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "chat",
                              style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20),
                            )),
                            const SizedBox(width: 20,),
                            const Icon(Icons.chat_rounded,color: Colors.pink,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "call",
                          style: GoogleFonts.pacifico(color: Colors.pink, fontSize: 20),
                        )),
                        const SizedBox(width: 20,),
                        const Icon(Icons.call,color: Colors.pink,)
                  ],
                ),
              ),
                ],
              ),
              
            ),
        
            // TextButton("data"),
            // Text("data")
          ],
        ),
      ),
    );
  }
}
