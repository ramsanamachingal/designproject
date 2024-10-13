import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopInfo extends StatefulWidget {
  const ShopInfo({super.key});

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                borderRadius: BorderRadius.circular(7),
                
              ),
              height: 60,
              width: 250,
              child: Center(
                child: Row(children: [SizedBox(width: 60,),
                  Icon(Icons.call,color: Colors.pink,),
                  SizedBox(width: 20,),
                  Text("Call",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:20),)
                ],),
              ),
            ),
            SizedBox(height: 30,),
             Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                borderRadius: BorderRadius.circular(7),
                
              ),
              height: 60,
              width: 250,
              child: Center(
                child: Row(children: [SizedBox(width: 60,),
                  Icon(Icons.chat,color: Colors.pink,),
                  SizedBox(width: 20,),
                  Text("Chat",style: GoogleFonts.pacifico(color:Colors.pink,fontSize:20),)
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}