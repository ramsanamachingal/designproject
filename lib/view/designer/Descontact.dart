import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerContact extends StatefulWidget {
  const DesignerContact({super.key});

  @override
  State<DesignerContact> createState() => _DesignerContactState();
}

class _DesignerContactState extends State<DesignerContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
             Container(
              height: 40,
              width: 220,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),borderRadius: BorderRadius.circular(7)
              ),child:  Center(
                child: Text("90876543",style:GoogleFonts.pacifico(
                                                  color: Colors.pink,
                                                  fontSize: 20) ,),
              ),
             ),IconButton(onPressed: (){}, icon: Icon(Icons.call))
         
          ],
        ),
      )
     
    );
  }
}