import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopProfile extends StatefulWidget {
  const ShopProfile({super.key});

  @override
  State<ShopProfile> createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage:
                  AssetImage("assets/34f30878d687ed5f545f12f984bf2774.jpg"),
            ),
            Text(
              "Max Fashion",
              style: GoogleFonts.pacifico(fontSize: 30, color: Colors.pink),
            ),
            Text(
              "7907048476",
              style: GoogleFonts.pacifico(fontSize: 25, color: Colors.pink),
            ),

            const DefaultTabController(length: 3, child: TabBar(tabs: [
              Tab(icon: Icon(Icons.image,color: Colors.pink,),),
              Tab(icon: Icon(Icons.videocam_rounded,),),
              Tab(icon: Icon(Icons.person,),)
            ])),TabBarView(children: [
              GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 3), itemBuilder: (context,index){
                return Container(
                  height: 70,width: 150,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/07e9ed3375cbffee32362548148529b3.jpg"))),
                );
              })
            ])
          ],
        ),
      )
    );
  }
}